import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/core/widgets/custom_message.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/auth_features/presentation/state_management/auth_provider.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/pages/change_password_page.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user1.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class CustomContainerForOtp extends StatefulWidget {
  const CustomContainerForOtp({
    super.key,
    required this.email,
    required this.toCreateAccount,
  });

  final String email;

  final bool toCreateAccount;

  @override
  State<CustomContainerForOtp> createState() => _CustomContainerForOtpState();
}

class _CustomContainerForOtpState extends State<CustomContainerForOtp> {
  bool canResend = true;

  int cooldown = 10;

  String otpCode = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,

      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(width * 0.1),
          topRight: Radius.circular(width * 0.1),
        ),
      ),

      child: Column(
        children: [
          SizedBox(height: width * 0.02),

          CustomFont(
            name: widget.toCreateAccount
                ? 'Verify Your Account'
                : 'Verify Reset Password OTP',

            fontColor: blackColor,

            fontSize: width * 0.06,
          ),

          SizedBox(height: width * 0.03),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),

            child: Text(
              widget.toCreateAccount
                  ? "We sent a verification code to your email"
                  : "Enter the OTP sent to your email to reset your password",

              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: width * 0.04,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          SizedBox(height: width * 0.06),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),

            child: PinCodeTextField(
              appContext: context,

              length: 6,

              keyboardType: TextInputType.number,

              animationType: AnimationType.fade,

              onChanged: (value) {
                otpCode = value;
              },

              onCompleted: (value) {
                otpCode = value;
              },

              pinTheme: PinTheme(
                shape: PinCodeFieldShape.circle,

                fieldHeight: width * 0.12,

                fieldWidth: width * 0.12,

                activeFillColor: const Color(0xff83C5BE),

                inactiveFillColor: const Color(0xff83C5BE),

                selectedFillColor: const Color(0xff83C5BE),

                activeColor: Colors.transparent,

                inactiveColor: Colors.transparent,

                selectedColor: Colors.transparent,
              ),

              enableActiveFill: true,
            ),
          ),

          SizedBox(height: width * 0.06),

          Consumer<AuthProvider>(
            builder: (context, provider, _) {
              return PrimaryButton(
                name: 'Submit',

                isLoading: provider.isLoading,

                pushing: () async {
                  FocusScope.of(context).unfocus();

                  if (otpCode.trim().length != 6) {
                    CustomMessage.error(
                      context,
                      "Please enter a valid 6-digit OTP",
                    );
                    return;
                  }
                  final authProvider = context.read<AuthProvider>();

                  if (widget.toCreateAccount) {
                    print("otpcooodddddd d dddddd dddddddddd  $otpCode");
                    print("otpcooodddddd d dddddd dddddddddd  ${widget.email}");
                    await authProvider.verifyOtp(widget.email, otpCode.trim());

                    if (authProvider.error != null) {
                      CustomMessage.error(context, authProvider.error!);
                      return;
                    }

                    CustomMessage.success(
                      context,
                      authProvider.otpData?.message ??
                          "OTP verified successfully",
                    );

                    Navigator.pushAndRemoveUntil(
                      context,

                      SlideRight(page: GetinfoFromUser1()),

                      (route) => false,
                    );
                  } else {
                    await authProvider.verifyForgotPasswordOtp(
                      widget.email,
                      otpCode.trim(),
                    );

                    if (authProvider.error != null) {
                      CustomMessage.error(context, authProvider.error!);

                      return;
                    }

                    if (authProvider.verifyForgotPasswordOtpData != null) {
                      CustomMessage.success(
                        context,
                        authProvider.verifyForgotPasswordOtpData?.message ??
                            "OTP verified successfully",
                      );

                      Navigator.pushReplacement(
                        context,
                        SlideRight(page: ChangePasswordPage()),
                      );
                    }
                  }
                },
              );
            },
          ),

          SizedBox(height: width * 0.04),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                "Didn't receive the code? ",

                style: TextStyle(
                  fontSize: width * 0.04,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),

              GestureDetector(
                onTap: () async {
                  if (!canResend) return;

                  final authProvider = context.read<AuthProvider>();

                  setState(() {
                    canResend = false;
                  });

                  if (widget.toCreateAccount) {
                    await authProvider.resendOtp(context, widget.email);
                  } else {
                    await authProvider.forgotPassword(context, widget.email);
                  }

                  Future.delayed(Duration(seconds: cooldown), () {
                    if (mounted) {
                      setState(() {
                        canResend = true;
                      });
                    }
                  });
                },

                child: Text(
                  canResend ? "Resend" : "Wait $cooldown sec",

                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: width * 0.05),
        ],
      ),
    );
  }
}

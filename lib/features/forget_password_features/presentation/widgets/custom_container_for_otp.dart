import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/core/widgets/custom_message.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/auth_features/presentation/state_management/auth_provider.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/pages/change_password_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/home_page.dart';

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
        color: Color(0xffEDF6F9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(width * 0.1),
          topRight: Radius.circular(width * 0.1),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: width * 0.02),

          CustomFont(
            name: 'We Have Sent An OTP To Your Email',
            fontColor: blackColor,
            fontSize: width * 0.06,
          ),

          SizedBox(height: width * 0.05),

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
                activeFillColor: Color(0xff83C5BE),
                inactiveFillColor: Color(0xff83C5BE),
                selectedFillColor: Color(0xff83C5BE),
                activeColor: Colors.transparent,
                inactiveColor: Colors.transparent,
                selectedColor: Colors.transparent,
              ),

              enableActiveFill: true,
            ),
          ),

          SizedBox(height: width * 0.05),

          Consumer<AuthProvider>(
            builder: (context, provider, _) {
              return PrimaryButton(
                name: 'Submit',

                isLoading: provider.isLoading,

                pushing: () async {
                  if (otpCode.length != 6) {
                    CustomMessage.error(context, "Enter valid OTP");

                    return;
                  }

                  final authProvider = context.read<AuthProvider>();

                  await authProvider.verifyOtp(widget.email, otpCode);

                  if (authProvider.otpData != null) {
                    CustomMessage.success(
                      context,

                      "Account verified successfully",
                    );
                    if (widget.toCreateAccount) {
                      Navigator.pushReplacement(
                        context,
                        SlideRight(page: HomePage()),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        SlideRight(page: ChangePasswordPage()),
                      );
                    }
                  }

                  if (authProvider.error != null) {
                    CustomMessage.error(context, authProvider.error!);
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
                "Didn't Receive? ",
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

                  await authProvider.resendOtp(widget.email);

                  if (authProvider.error != null) {
                    CustomMessage.error(context, authProvider.error!);
                  } else {
                    CustomMessage.success(context, "OTP sent again");
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
                  canResend ? "Click here" : "Wait $cooldown sec",
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: secondaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: width * 0.04),
        ],
      ),
    );
  }
}

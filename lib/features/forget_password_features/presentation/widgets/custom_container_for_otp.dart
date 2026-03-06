import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomContainerForOtp extends StatefulWidget {
  const CustomContainerForOtp({super.key});

  @override
  State<CustomContainerForOtp> createState() => _CustomContainerForOtpState();
}

class _CustomContainerForOtpState extends State<CustomContainerForOtp> {
  String otpCode = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: width * 0.55,
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

              length: 4,

              keyboardType: TextInputType.number,

              animationType: AnimationType.fade,

              onChanged: (value) {
                otpCode = value;
              },

              onCompleted: (value) {
                otpCode = value;
                print("OTP Completed: $otpCode");
              },

              pinTheme: PinTheme(
                shape: PinCodeFieldShape.circle,
                fieldHeight: width * 0.14,
                fieldWidth: width * 0.14,
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

          PrimaryButton(name: 'Submit', pushing: () {}),
          SizedBox(height: width * 0.06),
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
                onTap: () {
                  // _resendOtp
                },
                child: Text(
                  "Click here ",
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: secondaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

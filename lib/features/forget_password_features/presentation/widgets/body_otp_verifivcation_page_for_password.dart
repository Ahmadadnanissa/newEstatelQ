import 'package:estatelqapp/features/forget_password_features/presentation/widgets/custom_container_for_otp.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/widgets/otp_image.dart';
import 'package:flutter/material.dart';

class BodyOtpVerifivcationPageForPassword extends StatefulWidget {
  const BodyOtpVerifivcationPageForPassword({super.key});

  @override
  State<BodyOtpVerifivcationPageForPassword> createState() =>
      _BodyOtpVerifivcationPageForPasswordState();
}

class _BodyOtpVerifivcationPageForPasswordState
    extends State<BodyOtpVerifivcationPageForPassword> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          OtpImage(),
          SizedBox(height: width * 0.7),
          CustomContainerForOtp(),
        ],
      ),
    );
  }
}

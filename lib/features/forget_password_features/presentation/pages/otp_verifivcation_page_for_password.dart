import 'package:estatelqapp/features/forget_password_features/presentation/widgets/body_otp_verifivcation_page_for_password.dart';
import 'package:flutter/material.dart';

class OtpVerifivcationPageForPassword extends StatefulWidget {
  const OtpVerifivcationPageForPassword({super.key});
  static String id = 'OtpVerifivcationPageForPassword';

  @override
  State<OtpVerifivcationPageForPassword> createState() =>
      _OtpVerifivcationPageForPasswordState();
}

class _OtpVerifivcationPageForPasswordState
    extends State<OtpVerifivcationPageForPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BodyOtpVerifivcationPageForPassword()),
    );
  }
}

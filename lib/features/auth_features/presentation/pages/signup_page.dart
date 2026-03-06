import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/body_signup_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static String id = 'SignupPage';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: primaryColor, body: BodySignupPage()),
    );
  }
}

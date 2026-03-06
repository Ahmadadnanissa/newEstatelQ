import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/body_login_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = "LoginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: primaryColor, body: BodyLoginPage()),
    );
  }
}

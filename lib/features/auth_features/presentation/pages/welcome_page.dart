import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/body_welcom_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  static String id = "welcomPage";

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: primaryColor, body: BodyWelcomPage()),
    );
  }
}

import 'package:estatelqapp/features/forget_password_features/presentation/widgets/body_change_password_page.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});
  static String id = 'ChangePasswordPage';

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: BodyChangePasswordPage()));
  }
}

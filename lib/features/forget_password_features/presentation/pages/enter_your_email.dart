import 'package:estatelqapp/features/forget_password_features/presentation/widgets/body_enter_your_email_page.dart';
import 'package:flutter/material.dart';

class EnterYourEmail extends StatefulWidget {
  const EnterYourEmail({super.key});
  static String id = 'EnterYourEmail';

  @override
  State<EnterYourEmail> createState() => _EnterYourEmailState();
}

class _EnterYourEmailState extends State<EnterYourEmail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: BodyEnterYourEmailPage()));
  }
}

import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/widgets/body_enter_your_email_page.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/widgets/enter_your_email_image.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/widgets/enter_your_name_descr.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/widgets/text_form_field_for_email.dart';
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

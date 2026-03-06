import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/pages/enter_your_email.dart';
import 'package:flutter/material.dart';

class ForgetYourPassword extends StatefulWidget {
  const ForgetYourPassword({super.key});

  @override
  State<ForgetYourPassword> createState() => _ForgetYourPasswordState();
}

class _ForgetYourPasswordState extends State<ForgetYourPassword> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: width * 0.05, bottom: width * 0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, EnterYourEmail.id);
            },
            child: Text(
              'Forget Password?',
              style: TextStyle(
                color: secondaryColor,
                fontSize: width * 0.035,
                fontFamily: fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

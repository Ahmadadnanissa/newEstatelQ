import 'package:estatelqapp/core/widgets/secondary_button.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class GoToLoginButton extends StatefulWidget {
  const GoToLoginButton({super.key});

  @override
  State<GoToLoginButton> createState() => _GoToLoginButtonState();
}

class _GoToLoginButtonState extends State<GoToLoginButton> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.04),
      child: SecondaryButton(
        name: 'Login',
        pushing: () {
          Navigator.pushNamed(context, LoginPage.id);
        },
      ),
    );
  }
}

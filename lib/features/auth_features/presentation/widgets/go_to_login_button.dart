import 'package:estatelqapp/core/widgets/navigation_route.dart';
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
    return SecondaryButton(
      name: 'Login',
      pushing: () async {
        await Navigator.pushAndRemoveUntil(
          context,
          SlideRight(page: const LoginPage()),
          (route) => false,
        );
      },
    );
  }
}

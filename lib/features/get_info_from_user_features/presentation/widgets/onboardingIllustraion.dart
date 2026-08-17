import 'package:flutter/material.dart';

class OnboardingIllustration extends StatelessWidget {
  final String imagePath;

  const OnboardingIllustration({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 16),
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }
}

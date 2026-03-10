import 'package:flutter/material.dart';

class ImageHelpAndSupportPage extends StatelessWidget {
  const ImageHelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
      child: SizedBox(
        width: width * 0.8,
        height: width * 0.65,
        child: Image.asset(
          'assets/images/helpAndSupport.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

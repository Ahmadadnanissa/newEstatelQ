import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.02),
      child: Text(
        'Home,Anywhere',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,

          // النص الأساسي صار أخضر غامق
          color: secondaryColor,

          fontSize: width * 0.1,
          fontFamily: fontFamily,

          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

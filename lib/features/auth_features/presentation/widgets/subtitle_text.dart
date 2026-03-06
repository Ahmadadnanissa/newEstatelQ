import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Text(
        'from exploring to customizing,your home journey starts here',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff457B9D),
          fontSize: width * 0.05,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Text(
        'from exploring to customizing, your home journey starts here',
        textAlign: TextAlign.center,
        style: TextStyle(
          // نص ثانوي ناعم
          color: isDark ? darkSubtitleColor : greenColor,

          fontSize: width * 0.047,

          height: 1.4,

          fontFamily: fontFamily,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

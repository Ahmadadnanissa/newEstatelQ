import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class HowWeCanHelpYouText extends StatelessWidget {
  const HowWeCanHelpYouText({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CustomFont(
      name: 'How Can We Help you Today ?',
      fontColor: blackColor,
      fontSize: width * 0.045,
      fontWeight: FontWeight.w500,
    );
  }
}

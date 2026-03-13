import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class CustomTextInListYourProperty extends StatelessWidget {
  const CustomTextInListYourProperty({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CustomFont(
      name: name,
      fontColor: blackColor,
      fontSize: width * 0.043,
      fontWeight: FontWeight.w600,
    );
  }
}

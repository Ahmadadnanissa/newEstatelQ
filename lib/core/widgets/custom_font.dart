import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFont extends StatelessWidget {
  CustomFont({
    super.key,
    required this.name,
    required this.fontColor,
    required this.fontSize,
    this.fontWeight,
  });
  String name;
  double fontSize;
  Color? fontColor;
  FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      textAlign: TextAlign.center,

      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }
}

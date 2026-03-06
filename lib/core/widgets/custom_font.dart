import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFont extends StatelessWidget {
  CustomFont({
    super.key,
    required this.name,
    required this.fontColor,
    required this.fontSize,
  });
  String name;
  double fontSize;
  Color? fontColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
    );
  }
}

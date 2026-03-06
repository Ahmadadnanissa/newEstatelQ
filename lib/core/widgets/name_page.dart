import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NamePage extends StatelessWidget {
  NamePage({super.key, required this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.01),
      child: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: secondaryColor,
          fontSize: width * 0.075,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}

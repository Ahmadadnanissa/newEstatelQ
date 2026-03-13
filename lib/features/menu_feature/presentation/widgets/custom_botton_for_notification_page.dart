import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class CustomBottonForNotificationPage extends StatelessWidget {
  const CustomBottonForNotificationPage({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(width * 0.02),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: CustomFont(
          name: name,
          fontColor: blackColor,
          fontSize: width * 0.042,
        ),
      ),
    );
  }
}

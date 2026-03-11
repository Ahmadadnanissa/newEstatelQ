import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class CustomSubTitleForFilterPage extends StatelessWidget {
  const CustomSubTitleForFilterPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(width * 0.04),
      child: Row(
        children: [
          CustomFont(
            name: title,
            fontColor: blackColor,
            fontSize: width * 0.05,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

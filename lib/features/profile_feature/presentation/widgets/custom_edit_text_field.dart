import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class CustomEditTextField extends StatelessWidget {
  const CustomEditTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.icon,
  });
  final TextEditingController controller;
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: width * 0.17,
      decoration: BoxDecoration(
        color: primaryColor,
        border: Border.all(width: 0.5, color: secondaryColor),
        borderRadius: BorderRadius.circular(width * 0.01),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFont(
                    name: title,
                    fontColor: blackColor,
                    fontSize: width * 0.037,
                  ),

                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: TextStyle(
                        color: Color(0xff457B9D),
                        fontSize: width * 0.033,
                      ),
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}

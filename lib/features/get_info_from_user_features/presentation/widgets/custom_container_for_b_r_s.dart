// ignore: file_names
import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainerForBRS extends StatelessWidget {
  const CustomContainerForBRS({
    super.key,
    required this.image,
    required this.name,
    required this.widthOfContainer,
    required this.color,
  });
  final String image;
  final String name;
  final double widthOfContainer;
  final Color color;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * widthOfContainer,
      height: width * widthOfContainer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 5),
        color: primaryColor,
        border: Border.all(width: width * 0.005, color: color),
      ),
      child: Column(
        children: [
          Image.asset(image, width: width * 0.18, height: width * 0.18),
          Text(
            name,
            style: TextStyle(
              fontFamily: fontFamily,
              color: secondaryColor,
              fontSize: width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

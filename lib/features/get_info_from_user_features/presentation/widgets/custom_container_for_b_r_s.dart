// ignore: file_names
import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainerForBRS extends StatefulWidget {
  CustomContainerForBRS({
    super.key,
    required this.image,
    required this.name,
    required this.onTap,
  });
  String image;
  String name;
  void Function()? onTap;

  @override
  State<CustomContainerForBRS> createState() => _CustomContainerForBRSState();
}

class _CustomContainerForBRSState extends State<CustomContainerForBRS> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: width * 0.3,
        height: width * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 5),
          color: primaryColor,
          border: Border.all(width: width * 0.005, color: secondaryColor),
        ),
        child: Column(
          children: [
            Image.asset(
              widget.image,
              width: width * 0.18,
              height: width * 0.18,
            ),
            Text(
              widget.name,
              style: TextStyle(
                fontFamily: fontFamily,
                color: secondaryColor,
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

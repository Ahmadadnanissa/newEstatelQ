// ignore_for_file: must_be_immutable

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class TypeOfProperty extends StatefulWidget {
  TypeOfProperty({super.key, required this.image, required this.type});
  String image;
  String type;

  @override
  State<TypeOfProperty> createState() => _TypeOfPropertyState();
}

class _TypeOfPropertyState extends State<TypeOfProperty> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.005),
      child: Container(
        height: width * 0.07,
        decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.circular(width * 0.03),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Center(
            child: Row(
              children: [
                Image.asset(
                  widget.image,
                  width: width * 0.06,
                  height: width * 0.06,
                ),
                CustomFont(
                  name: widget.type,
                  fontColor: primaryColor,
                  fontSize: width * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

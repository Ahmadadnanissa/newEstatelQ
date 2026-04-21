import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class CustomBottonForNotificationPage extends StatelessWidget {
  const CustomBottonForNotificationPage({
    super.key,
    required this.name,
    this.number,
  });
  final String name;
  final int? number;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return name == 'All'
        ? Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(width * 0.04),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: CustomFont(
                name: name,
                fontColor: Colors.white,
                fontSize: width * 0.042,
              ),
            ),
          )
        : number == 0
        ? Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(width * 0.04),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: CustomFont(
                name: name,
                fontColor: Colors.white,
                fontSize: width * 0.042,
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(width * 0.04),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: CustomFont(
                    name: name,
                    fontColor: Colors.white,
                    fontSize: width * 0.042,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: CustomFont(
                        name: number.toString(),
                        fontColor: blackColor,
                        fontSize: width * 0.03,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

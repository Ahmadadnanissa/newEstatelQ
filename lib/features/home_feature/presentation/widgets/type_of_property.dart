import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class TypeOfProperty extends StatelessWidget {
  const TypeOfProperty({
    super.key,
    required this.image,
    required this.type,
    required this.backgroundColor,
    required this.isSelected,
    required this.onTap,
  });
  final String image;
  final String type;
  final Color backgroundColor;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.005),
      child: InkWell(
        borderRadius: BorderRadius.circular(width * 0.03),
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          height: width * 0.07,
          decoration: BoxDecoration(
            color: isSelected ? blackColor : backgroundColor,
            borderRadius: BorderRadius.circular(width * 0.03),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Center(
              child: Row(
                children: [
                  Image.asset(image, width: width * 0.06, height: width * 0.06),
                  CustomFont(
                    name: type,
                    fontColor: isSelected ? primaryColor : blackColor,
                    fontSize: width * 0.05,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

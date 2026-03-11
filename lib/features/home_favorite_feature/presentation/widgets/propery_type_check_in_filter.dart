import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class ProperyTypeCheckInFilter extends StatelessWidget {
  const ProperyTypeCheckInFilter({
    super.key,
    required this.image,
    required this.type,
    required this.isSelected,
  });
  final String image;
  final String type;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.9,
      height: width * 0.13,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            offset: Offset(0, 3),
            blurRadius: 10,
          ),
        ],
        color: isSelected ? greenColor : Color(0xffEDF6F9),
        borderRadius: BorderRadius.circular(width * 0.03),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image, width: width * 0.1, height: width * 0.1),
          SizedBox(width: width * 0.02),
          CustomFont(
            name: type,
            fontColor: blackColor,
            fontSize: width * 0.045,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}

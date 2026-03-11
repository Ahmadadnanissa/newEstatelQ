import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class BuyOrRentCustomContainer extends StatelessWidget {
  const BuyOrRentCustomContainer({
    super.key,
    required this.image,
    required this.forWhat,
    required this.isSelected,
  });
  final String image;
  final String forWhat;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.44,
      height: width * 0.24,
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, width: width * 0.16, height: width * 0.16),
            CustomFont(
              name: forWhat,
              fontColor: blackColor,
              fontSize: width * 0.04,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}

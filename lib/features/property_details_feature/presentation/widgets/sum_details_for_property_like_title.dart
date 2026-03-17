import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class SumDetailsForPropertyLikeTitle extends StatelessWidget {
  const SumDetailsForPropertyLikeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: width * 0.01,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFont(
                name: 'Mountain View Villa',
                fontColor: blackColor,
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold,
              ),
              CustomFont(
                name: 'Al-Qadmous, Tartous, Syria',
                fontColor: Color(0xff5F6264),
                fontSize: width * 0.035,
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFont(
                name: '\$ 165,000',
                fontColor: blackColor,
                fontSize: width * 0.045,
                fontWeight: FontWeight.bold,
              ),
              CustomFont(
                name: 'for sale',
                fontColor: Color(0xff5F6264),
                fontSize: width * 0.03,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

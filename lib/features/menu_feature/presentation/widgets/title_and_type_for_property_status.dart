import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class TitleAndTypeForPropertyStatus extends StatelessWidget {
  const TitleAndTypeForPropertyStatus({
    super.key,
    required this.title,
    required this.type,
    required this.price,
    required this.forWhat,
  });
  final String title;
  final String type;
  final String price;
  final String forWhat;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: width * 0.03,
        horizontal: width * 0.03,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFont(
                name: title,
                fontColor: blackColor,
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold,
              ),
              CustomFont(
                name: type,
                fontColor: Color(0xff5F6264),
                fontSize: width * 0.035,
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFont(
                name: '\$$price',
                fontColor: blackColor,
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold,
              ),
              CustomFont(
                name: forWhat,
                // widget.type
                fontColor: Color(0xff5F6264),
                fontSize: width * 0.035,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class MoreDetailsForPropertyCard extends StatelessWidget {
  const MoreDetailsForPropertyCard({
    super.key,
    required this.icon,
    required this.type,
  });
  final Icon icon;
  final String type;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      height: width * 0.08,
      width: width * 0.29,
      decoration: BoxDecoration(
        color: greenColor,
        borderRadius: BorderRadius.circular(width * 0.03),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            CustomFont(
              name: type,
              fontColor: blackColor,
              fontSize: width * 0.035,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class DescribeYourIssueText extends StatelessWidget {
  const DescribeYourIssueText({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.06, top: width * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomFont(
            name: 'Describe your issue',
            fontColor: blackColor,
            fontSize: width * 0.04,
          ),
        ],
      ),
    );
  }
}

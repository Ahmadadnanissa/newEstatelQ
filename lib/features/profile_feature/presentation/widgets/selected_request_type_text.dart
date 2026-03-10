import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class SelectedRequestTypeText extends StatelessWidget {
  const SelectedRequestTypeText({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.06, top: width * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomFont(
            name: 'Select Request Type',
            fontColor: blackColor,
            fontSize: width * 0.04,
          ),
        ],
      ),
    );
  }
}

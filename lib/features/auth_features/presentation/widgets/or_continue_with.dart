import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class OrContinueWith extends StatelessWidget {
  const OrContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: width * 0.1,
        horizontal: width * 0.03,
      ),
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 1, color: Color(0xff5F6264))),
          CustomFont(
            name: ' Or Continue With ',
            fontColor: Color(0xff457B9D),
            fontSize: width * 0.015,
          ),
          Expanded(child: Divider(thickness: 1, color: Color(0xff5F6264))),
        ],
      ),
    );
  }
}

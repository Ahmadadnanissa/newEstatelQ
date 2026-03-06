import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class EnterYourNameDescr extends StatelessWidget {
  const EnterYourNameDescr({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        top: width * 0.06,
        bottom: width * 0.03,
        left: width * 0.03,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomFont(
            name: 'Enter Your Email : ',
            fontColor: Color(0xff5F6264),
            fontSize: width * 0.06,
          ),
        ],
      ),
    );
  }
}

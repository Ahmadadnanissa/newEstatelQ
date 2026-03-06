import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class GoogleOrFaceWidget extends StatefulWidget {
  const GoogleOrFaceWidget({super.key});

  @override
  State<GoogleOrFaceWidget> createState() => _GoogleOrFaceWidgetState();
}

class _GoogleOrFaceWidgetState extends State<GoogleOrFaceWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: width * 0.2,
            height: width * 0.15,
            decoration: BoxDecoration(
              color: Color(0xffEDF6F9),
              borderRadius: BorderRadius.circular(width * 0.07),
            ),
            child: Image.asset('assets/images/Google.png'),
          ),
          Container(
            width: width * 0.2,
            height: width * 0.15,
            decoration: BoxDecoration(
              color: greenColor,
              borderRadius: BorderRadius.circular(width * 0.07),
            ),
            child: Icon(
              Icons.facebook_sharp,
              color: Colors.blue,
              size: width * 0.1,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class CustomImageForEditProfile extends StatelessWidget {
  const CustomImageForEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width * 0.3,
          height: width * 0.3,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(width * 0.3),
            border: Border.all(color: secondaryColor, width: 0.5),
          ),
          child: Center(child: Image.asset('assets/images/person.png')),
        ),
      ],
    );
  }
}

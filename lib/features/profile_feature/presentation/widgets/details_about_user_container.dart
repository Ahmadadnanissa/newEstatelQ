import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class DetailsAboutUserContainer extends StatelessWidget {
  const DetailsAboutUserContainer({
    super.key,
    required this.userName,
    required this.email,
    required this.adress,
    required this.phoneNumber,
    required this.imageProfile,
  });
  final String userName;
  final String email;
  final String adress;
  final String phoneNumber;
  final String imageProfile;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffEDF6F9),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(width * 0.1),
          bottomLeft: Radius.circular(width * 0.1),
        ),
      ),

      child: Column(
        children: [
          SizedBox(height: width * 0.06),
          Container(
            width: width * 0.3,
            height: width * 0.3,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(width * 0.3),
            ),
            child: Center(child: Image.asset(imageProfile)),
          ),
          SizedBox(height: width * 0.03),
          CustomFont(
            name: userName,
            fontColor: blackColor,
            fontSize: width * 0.05,
            fontWeight: FontWeight.bold,
          ),
          CustomFont(
            name: email,
            fontColor: blackColor,
            fontSize: width * 0.05,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: width * 0.02),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomFont(
                name: phoneNumber,
                fontColor: Color(0xff5F6264),
                fontSize: width * 0.035,
              ),
              CustomFont(
                name: adress,
                fontColor: Color(0xff5F6264),
                fontSize: width * 0.035,
              ),
            ],
          ),
          SizedBox(height: width * 0.04),
        ],
      ),
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_image_for_description.dart';
import 'package:flutter/material.dart';

class DetailsOfDescription extends StatelessWidget {
  const DetailsOfDescription({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFont(
            name: 'Description',
            fontColor: blackColor,
            fontSize: width * 0.06,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: width * 0.02),
          Text(
            'A clean and comfortable apartment with good space and natural light. Close to shops and public transportation.',
            style: TextStyle(
              color: Color(0xff5F6264),
              fontSize: width * 0.04,
              fontFamily: fontFamily,
            ),
          ),
          SizedBox(height: width * 0.04),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomImageForDescription(
                  image: 'assets/images/jesse-collins-LUitWpwc008-unsplash.jpg',
                ),
                SizedBox(width: width * 0.02),
                CustomImageForDescription(
                  image: 'assets/images/uday-vatti-8YC9T7W-lE4-unsplash.jpg',
                ),
                SizedBox(width: width * 0.02),
                CustomImageForDescription(
                  image: 'assets/images/tobias-wilden-4453DIQWtsQ-unsplash.jpg',
                ),
                SizedBox(width: width * 0.02),
                CustomImageForDescription(
                  image: 'assets/images/bogdan-vaskan-1taEJJwIv-0-unsplash.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

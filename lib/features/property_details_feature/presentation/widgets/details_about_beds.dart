import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_image_for_beds.dart';
import 'package:flutter/material.dart';

class DetailsAboutBeds extends StatelessWidget {
  const DetailsAboutBeds({
    super.key,
    required this.descr,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
  });
  final String descr;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        children: [
          Text(
            descr,
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
                CustomImageForBeds(image: image1),
                SizedBox(width: width * 0.02),
                CustomImageForBeds(image: image2),
                SizedBox(width: width * 0.02),
                CustomImageForBeds(image: image3),
                SizedBox(width: width * 0.02),
                CustomImageForBeds(image: image4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

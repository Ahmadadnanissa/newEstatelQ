import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_image_for_beds.dart';
import 'package:flutter/material.dart';

class DetailsAboutBath extends StatelessWidget {
  const DetailsAboutBath({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        children: [
          Text(
            'We have two bathrooms that have been well-tiled and decorated, each featuring a bathtub and an area exceeding 6 square meters.',
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
                CustomImageForBeds(
                  image:
                      'assets/images/steven-ungermann-1AF5hP6F4tI-unsplash.jpg',
                ),
                SizedBox(width: width * 0.02),
                CustomImageForBeds(
                  image:
                      'assets/images/lotus-design-n-print-g51F6-WYzyU-unsplash.jpg',
                ),
                SizedBox(width: width * 0.02),
                CustomImageForBeds(
                  image: 'assets/images/backbone-L4iRkKL5dng-unsplash.jpg',
                ),
                SizedBox(width: width * 0.02),
                CustomImageForBeds(
                  image: 'assets/images/phil-hearing-U7PitHRnTNU-unsplash.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

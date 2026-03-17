import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_image_for_beds.dart';
import 'package:flutter/material.dart';

class DetailsAboutSqft extends StatelessWidget {
  const DetailsAboutSqft({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        children: [
          Text(
            'The net area of ​​the property is 150 square meters, with an external garden measuring 50 square meters; thus, the total area of ​​the property—including the garden—is 200 square meters.',
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
                      'assets/images/amsterdam-city-archives-kl5hdStOjFk-unsplash.jpg',
                ),
                SizedBox(width: width * 0.02),
                CustomImageForBeds(
                  image:
                      'assets/images/amsterdam-city-archives-a1XrwixH1X8-unsplash.jpg',
                ),
                SizedBox(width: width * 0.02),
                CustomImageForBeds(
                  image:
                      'assets/images/amsterdam-city-archives-7ZhvsCAOERs-unsplash.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

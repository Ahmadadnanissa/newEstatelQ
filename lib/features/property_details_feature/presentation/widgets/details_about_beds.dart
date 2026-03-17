import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_image_for_beds.dart';
import 'package:flutter/material.dart';

class DetailsAboutBeds extends StatelessWidget {
  const DetailsAboutBeds({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        children: [
          Text(
            'The home features two rooms—one bedroom and one living room—both offering views of the city. The bedroom measures 20 square meters, while the other room measures 30 square meters.',
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
                      'assets/images/fairuz-naufal-zaki-DzCGADQSDxM-unsplash.jpg',
                ),
                SizedBox(width: width * 0.02),
                CustomImageForBeds(
                  image: 'assets/images/spacejoy-KJUGhE9ojro-unsplash.jpg',
                ),
                SizedBox(width: width * 0.02),
                CustomImageForBeds(
                  image:
                      'assets/images/lotus-design-n-print-0sDzRgrN_pI-unsplash.jpg',
                ),
                SizedBox(width: width * 0.02),
                CustomImageForBeds(
                  image: 'assets/images/don-kaveen-NFbwes_e-jI-unsplash.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

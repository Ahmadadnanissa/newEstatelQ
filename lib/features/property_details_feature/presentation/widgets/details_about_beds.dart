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

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color textColor = isDark ? darkSubtitleColor : Colors.grey;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // ================= DESCRIPTION =================
          Text(
            descr,
            style: TextStyle(
              color: textColor,
              fontSize: width * 0.04,
              fontFamily: fontFamily,
              height: 1.4,
            ),
          ),

          SizedBox(height: width * 0.04),

          // ================= IMAGES =================
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

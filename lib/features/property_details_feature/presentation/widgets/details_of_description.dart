import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_image_for_description.dart';
import 'package:flutter/material.dart';

class DetailsOfDescription extends StatelessWidget {
  const DetailsOfDescription({
    super.key,
    required this.fullDescr,
    required this.images,
    // required this.image1,
    // required this.image2,
    // required this.image3,
    // required this.image4,
  });
  final String fullDescr;
  // final String image1;
  // final String image2;
  // final String image3;
  // final String image4;
  final List<String> images;
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
            fullDescr,

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
              children: images.map((e) {
                return Padding(
                  padding: EdgeInsets.only(right: 8),

                  child: CustomImageForDescription(image: e),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

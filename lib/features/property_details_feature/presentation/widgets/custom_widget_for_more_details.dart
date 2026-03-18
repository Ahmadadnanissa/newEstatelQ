import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_image_for_more_details.dart';
import 'package:flutter/material.dart';

class CustomWidgetForMoreDetails extends StatefulWidget {
  const CustomWidgetForMoreDetails({
    super.key,
    required this.whichDetail,
    required this.value,
    required this.description,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
  });
  final String whichDetail;
  final String value;
  final String description;
  final String image1;
  final String image2;
  final String image3;
  final String image4;

  @override
  State<CustomWidgetForMoreDetails> createState() =>
      _CustomWidgetForMoreDetailsState();
}

class _CustomWidgetForMoreDetailsState
    extends State<CustomWidgetForMoreDetails> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            focusColor: primaryColor,
            hoverColor: primaryColor,
            splashColor: primaryColor,
            highlightColor: primaryColor,

            onTap: () {
              isSelected = !isSelected;
              setState(() {});
            },
            child: Row(
              children: [
                CustomFont(
                  name: widget.whichDetail,
                  fontColor: blackColor,
                  fontSize: width * 0.045,
                ),
                Spacer(),
                CustomFont(
                  name: widget.value,
                  fontColor: blackColor,
                  fontSize: width * 0.045,
                ),
                SizedBox(width: width * 0.02),
                Icon(
                  isSelected
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: secondaryColor,
                  size: width * 0.07,
                ),
              ],
            ),
          ),

          Column(
            children: isSelected
                ? [
                    SizedBox(height: width * 0.02),
                    Text(
                      widget.description,

                      style: TextStyle(
                        color: Color(0xff5F6264),
                        fontSize: width * 0.04,
                        fontFamily: fontFamily,
                      ),
                    ),
                    SizedBox(height: width * 0.02),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CustomImageForMoreDetails(image: widget.image1),
                          SizedBox(width: width * 0.02),
                          CustomImageForMoreDetails(image: widget.image2),
                          SizedBox(width: width * 0.02),
                          CustomImageForMoreDetails(image: widget.image3),
                          SizedBox(width: width * 0.02),
                          CustomImageForMoreDetails(image: widget.image4),
                        ],
                      ),
                    ),
                    SizedBox(height: width * 0.02),
                  ]
                : [],
          ),
          SizedBox(height: width * 0.02),
        ],
      ),
    );
  }
}

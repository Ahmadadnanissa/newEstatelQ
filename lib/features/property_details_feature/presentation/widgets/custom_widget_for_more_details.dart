import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/outdoor_detail_model.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_image_for_more_details.dart';
import 'package:flutter/material.dart';

class CustomWidgetForOutdoorPlaces extends StatefulWidget {
  const CustomWidgetForOutdoorPlaces({super.key, required this.outDoor});

  final OutdoorItemModel outDoor;
  @override
  State<CustomWidgetForOutdoorPlaces> createState() =>
      _CustomWidgetForOutdoorPlacesState();
}

class _CustomWidgetForOutdoorPlacesState
    extends State<CustomWidgetForOutdoorPlaces> {
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
                  name: widget.outDoor.type,
                  fontColor: blackColor,
                  fontSize: width * 0.045,
                ),
                Spacer(),
                CustomFont(
                  name: "Available",
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
                      widget.outDoor.description ?? "",

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
                        children: widget.outDoor.photos.map((img) {
                          return Padding(
                            padding: EdgeInsets.only(right: width * 0.02),
                            child: CustomImageForMoreDetails(image: img),
                          );
                        }).toList(),
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

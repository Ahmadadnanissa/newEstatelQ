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

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color titleColor = Theme.of(context).colorScheme.onSurface;

    final Color subtitleColor = isDark ? darkSubtitleColor : Colors.grey;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,

            onTap: () {
              isSelected = !isSelected;
              setState(() {});
            },

            child: Row(
              children: [
                CustomFont(
                  name: widget.outDoor.type,
                  fontColor: titleColor,
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.w600,
                ),

                const Spacer(),

                CustomFont(
                  name: "Available",
                  fontColor: secondaryColor,
                  fontSize: width * 0.04,
                ),

                SizedBox(width: width * 0.02),

                Icon(
                  isSelected
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: secondaryColor,
                  size: width * 0.07,
                ),
              ],
            ),
          ),

          AnimatedCrossFade(
            firstChild: const SizedBox(),

            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: width * 0.02),

                Text(
                  widget.outDoor.description ?? "",
                  style: TextStyle(
                    color: subtitleColor,
                    fontSize: width * 0.04,
                    fontFamily: fontFamily,
                    height: 1.4,
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
              ],
            ),

            crossFadeState: isSelected
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,

            duration: const Duration(milliseconds: 250),
          ),

          SizedBox(height: width * 0.02),
        ],
      ),
    );
  }
}

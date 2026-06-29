import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/out_door_model.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_image_for_more_details.dart';
import 'package:flutter/material.dart';

class CustomWidgetForOutdoorPlaces extends StatefulWidget {
  const CustomWidgetForOutdoorPlaces({super.key, required this.outDoor});

  final OutdoorItem outDoor;

  @override
  State<CustomWidgetForOutdoorPlaces> createState() =>
      _CustomWidgetForOutdoorPlacesState();
}

class _CustomWidgetForOutdoorPlacesState
    extends State<CustomWidgetForOutdoorPlaces> {
  String formatOutdoorType(String type) {
    return type
        .toLowerCase()
        .split('_')
        .map(
          (word) =>
              word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '',
        )
        .join(' ');
  }

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
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: Row(
              children: [
                CustomFont(
                  name: formatOutdoorType(widget.outDoor.type),
                  fontColor: titleColor,
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.w600,
                ),

                const Spacer(),

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

                /// ⚠️ FIX: desc بدل description
                if (widget.outDoor.desc != null)
                  Text(
                    widget.outDoor.desc.toString(),
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
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: width * 0.02),
                        child: CustomImageForMoreDetails(
                          image:
                              'assets/images/roberto-nickson-h1_ILkb9tLo-unsplash.jpg',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: width * 0.02),
                        child: CustomImageForMoreDetails(
                          image:
                              'assets/images/don-kaveen-NFbwes_e-jI-unsplash.jpg',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: width * 0.02),
                        child: CustomImageForMoreDetails(
                          image:
                              'assets/images/john-fornander-y3_AHHrxUBY-unsplash.jpg',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: width * 0.02),
                        child: CustomImageForMoreDetails(
                          image:
                              'assets/images/matthew-smith-rFBA42UFpLs-unsplash.jpg',
                        ),
                      ),
                    ],

                    // widget.outDoor.photos.map((img) {
                    //   return Padding(
                    //     padding: EdgeInsets.only(right: width * 0.02),
                    //     child: CustomImageForMoreDetails(
                    //       image:
                    //           'assets/images/roberto-nickson-h1_ILkb9tLo-unsplash.jpg',
                    //     ),
                    //   );
                    // }).toList(),
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

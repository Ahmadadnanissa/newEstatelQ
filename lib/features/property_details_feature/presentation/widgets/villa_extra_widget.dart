import 'package:flutter/material.dart';

import '../../data/models/villa_mode.dart';
import '../../../../core/app_theme.dart';
import '../../../../core/widgets/custom_font.dart';

import 'custom_nearby_widget.dart';

class VillaExtraWidget extends StatelessWidget {
  final VillaModel property;

  const VillaExtraWidget({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    List<String> details = [];

    if (property.numOfFloors != null) {
      details.add("Floors : ${property.numOfFloors}");
    }

    if (property.fireplace) {
      details.add("Fireplace");
    }

    if (property.basementArea != null) {
      details.add("Basement : ${property.basementArea} m²");
    }

    details.add("Heater : ${property.heating}");
    details.add("Furnished : ${property.furnishing}");
    details.add("Built : ${property.constructionYear}");

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color textColor =
        Theme.of(context).textTheme.bodyMedium?.color ?? blackColor;

    final Color chipBg = isDark
        ? const Color(0xff1C1C1E)
        : const Color(0xffF7F8FA);

    final Color borderColor = greenColor.withOpacity(0.25);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: width * .02,
        horizontal: width * .03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          CustomFont(
            name: 'More Details',
            fontColor: textColor,
            fontSize: width * .05,
            fontWeight: FontWeight.bold,
          ),

          SizedBox(height: width * 0.04),

          /// Chips
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: details.map((e) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: width * 0.02,
                ),
                decoration: BoxDecoration(
                  color: chipBg,
                  borderRadius: BorderRadius.circular(width * 0.03),
                  border: Border.all(color: borderColor),
                ),
                child: CustomFont(
                  name: e,
                  fontColor: textColor.withOpacity(0.8),
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.w500,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

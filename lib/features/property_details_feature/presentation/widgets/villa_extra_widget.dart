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

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: width * .02,
        horizontal: width * .03,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              CustomFont(
                name: 'More Details',

                fontColor: blackColor,

                fontSize: width * .05,

                fontWeight: FontWeight.bold,
              ),
            ],
          ),

          SizedBox(height: 15),

          Wrap(
            spacing: 10,

            runSpacing: 10,

            children: details.map((e) {
              return CustomNearbyWidget(name: e);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

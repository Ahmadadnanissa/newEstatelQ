import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/hall_model.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_nearby_widget.dart';

import 'package:flutter/material.dart';

class HallExtraWidget extends StatelessWidget {
  final HallModel property;

  const HallExtraWidget({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    List<String> details = [];

    if (property.floorNumber != null) {
      details.add("Floor : ${property.floorNumber}");
    }

    if (property.elevator) {
      details.add("Elevator");
    }

    details.add("Parking : ${property.parking}");

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

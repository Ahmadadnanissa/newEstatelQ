import 'package:flutter/material.dart';

import '../../data/models/appartment_model.dart';
import 'custom_nearby_widget.dart';

class ApartmentExtraWidget extends StatelessWidget {
  final ApartmentModel property;

  const ApartmentExtraWidget({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
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
      padding: EdgeInsets.all(15),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text("More Details"),

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

import 'package:flutter/material.dart';
import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/store_model.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_nearby_widget.dart';

class StoreExtraWidget extends StatelessWidget {
  final StoreModel property;

  const StoreExtraWidget({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    List<String> details = [];

    if (property.floorNumber != null) {
      details.add("Floor : ${property.floorNumber}");
    }

    details.add("Parking : ${property.parking}");

    details.add("Heater : ${property.heating}");

    details.add("Furnished : ${property.furnishing}");

    details.add("Built : ${property.constructionYear}");

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: width * 0.02,
        horizontal: width * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFont(
            name: "More Details",
            fontColor: blackColor,
            fontSize: width * 0.05,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 15),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: details
                .map((e) => CustomNearbyWidget(name: e))
                .toList(),
          ),
        ],
      ),
    );
  }
}
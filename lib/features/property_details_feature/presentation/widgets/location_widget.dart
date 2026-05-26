import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/property_model.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/pages/property_on_map_page.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final PropertyModel property;

  const LocationWidget({super.key, required this.property});

  List<String> getNearbyServices() {
    if (property.area == null) return [];

    final Map<String, dynamic> areaMap = Map<String, dynamic>.from(
      property.area!,
    );

    return areaMap.entries
        .where((e) => e.value == true)
        .map((e) => e.key)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (property.latitude == null || property.longitude == null) {
      return Padding(
        padding: const EdgeInsets.all(15),
        child: Text("Location unavailable"),
      );
    }

    final nearby = getNearbyServices();

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFont(
            name: 'Location',
            fontColor: blackColor,
            fontSize: width * 0.05,
            fontWeight: FontWeight.bold,
          ),

          const SizedBox(height: 15),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PropertyOnMap(
                        propertyLat: property.latitude!,
                        propertyLng: property.longitude!,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: width * .4,
                  height: width * .25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/map_Image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  property.location,
                  style: TextStyle(fontSize: width * 0.03),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          if (nearby.isNotEmpty) ...[
            CustomFont(
              name: "Nearby Services",
              fontColor: blackColor,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w600,
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: nearby.map((item) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: primaryColor),
                  ),
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: width * 0.03,
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}

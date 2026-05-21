import 'package:estatelqapp/features/property_details_feature/data/models/property_model.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/pages/property_on_map_page.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final PropertyModel property;

  const LocationWidget({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (property.latitude == null || property.longitude == null) {
      return Padding(
        padding: EdgeInsets.all(15),

        child: Text("Location unavailable"),
      );
    }

    return Padding(
      padding: EdgeInsets.all(15),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text("Location"),

          SizedBox(height: 15),

          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (_) {
                        return PropertyOnMap(
                          propertyLat: property.latitude!,

                          propertyLng: property.longitude!,
                        );
                      },
                    ),
                  );
                },

                child: Container(
                  width: width * .4,

                  height: width * .25,

                  child: Image.asset(
                    'assets/images/map_Image.png',

                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(width: 10),

              Expanded(child: Text(property.location)),
            ],
          ),
        ],
      ),
    );
  }
}

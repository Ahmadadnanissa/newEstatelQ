import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/property_model.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/pages/property_on_map_page.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final PropertyModel property;

  const LocationWidget({super.key, required this.property});

  List<String> getNearbyServices() {
    return property.nearByPlaces
        .map((e) => e['category']?.toString() ?? '')
        .where((e) => e.isNotEmpty)
        .toSet()
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color titleColor = secondaryColor;

    final Color textColor = isDark ? darkSubtitleColor : Colors.grey;

    final Color chipBg = isDark
        ? Colors.white10
        : primaryColor.withValues(alpha: 0.1);

    if (property.lat == 0 && property.lon == 0) {
      return Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: CustomFont(
          name: "Location unavailable",
          fontColor: textColor,
          fontSize: width * 0.04,
        ),
      );
    }

    final nearby = getNearbyServices();

    return Padding(
      padding: EdgeInsets.all(width * 0.04),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // ================= TITLE =================
          CustomFont(
            name: 'Location',
            fontColor: titleColor,
            fontSize: width * 0.055,
            fontWeight: FontWeight.w600,
          ),

          SizedBox(height: width * 0.03),

          // ================= MAP + LOCATION =================
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PropertyOnMap(
                        propertyLat: property.lat,
                        propertyLng: property.lon,
                      ),
                    ),
                  );
                },

                child: Container(
                  width: width * .4,
                  height: width * .25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isDark ? Colors.white10 : Colors.black12,
                    ),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/map_Image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              SizedBox(width: width * 0.03),

              Expanded(
                child: CustomFont(
                  name: property.location,
                  fontColor: textColor,
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          SizedBox(height: width * 0.04),

          // ================= NEARBY =================
          if (nearby.isNotEmpty) ...[
            CustomFont(
              name: "Nearby Services",
              fontColor: titleColor,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w600,
            ),

            SizedBox(height: width * 0.02),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: nearby.map((item) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: chipBg,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isDark ? Colors.white10 : Colors.black12,
                    ),
                  ),
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: width * 0.03,
                      color: textColor,
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

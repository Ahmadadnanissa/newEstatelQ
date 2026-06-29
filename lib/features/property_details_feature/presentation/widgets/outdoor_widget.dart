import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/out_door_model.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_widget_for_more_details.dart';
import 'package:flutter/material.dart';

class OutdoorWidget extends StatelessWidget {
  final List<OutdoorItem> outdoorItems;

  const OutdoorWidget({super.key, required this.outdoorItems});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color titleColor = secondaryColor;

    final Color textColor = isDark ? darkSubtitleColor : Colors.grey;

    if (outdoorItems.isEmpty) {
      return const SizedBox();
    }

    return Padding(
      padding: EdgeInsets.all(width * 0.04),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // ================= TITLE =================
          Text(
            "Outdoor Details",
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: width * 0.055,
              fontWeight: FontWeight.w600,
              color: titleColor,
            ),
          ),

          SizedBox(height: width * 0.03),

          // ================= LIST =================
          ListView.builder(
            itemCount: outdoorItems.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),

            itemBuilder: (context, index) {
              return CustomWidgetForOutdoorPlaces(outDoor: outdoorItems[index]);
            },
          ),
        ],
      ),
    );
  }
}

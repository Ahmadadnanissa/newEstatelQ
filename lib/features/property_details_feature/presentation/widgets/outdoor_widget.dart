import 'package:estatelqapp/features/property_details_feature/data/models/outdoor_detail_model.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_widget_for_more_details.dart';
import 'package:flutter/material.dart';

class OutdoorWidget extends StatelessWidget {
  final List<OutdoorItemModel> outdoorItems;

  const OutdoorWidget({super.key, required this.outdoorItems});

  @override
  Widget build(BuildContext context) {
    if (outdoorItems.isEmpty) {
      return SizedBox();
    }

    return Padding(
      padding: EdgeInsets.all(15),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text("Outdoor Details"),

          SizedBox(height: 15),

          ListView.builder(
            itemCount: outdoorItems.length,

            shrinkWrap: true,

            physics: NeverScrollableScrollPhysics(),

            itemBuilder: (context, index) {
              return CustomWidgetForOutdoorPlaces(outDoor: outdoorItems[index]);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:estatelqapp/features/property_details_feature/data/models/house_model.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/base_property_details_widget.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/house_extra_widget.dart';

import 'package:flutter/material.dart';

class HouseDetailsWidget extends StatelessWidget {
  final HouseModel property;

  const HouseDetailsWidget({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            BasePropertyDetailsWidget(property: property),

            HouseExtraWidget(property: property),
          ],
        ),
      ),
    );
  }
}

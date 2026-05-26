import 'package:flutter/material.dart';
import '../../data/models/villa_mode.dart';
import 'base_property_details_widget.dart';
import 'villa_extra_widget.dart';

class VillaDetailsWidget extends StatelessWidget {
  final VillaModel property;

  const VillaDetailsWidget({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            BasePropertyDetailsWidget(property: property),

            VillaExtraWidget(property: property),
          ],
        ),
      ),
    );
  }
}

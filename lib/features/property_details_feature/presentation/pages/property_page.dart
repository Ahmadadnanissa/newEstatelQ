import 'package:estatelqapp/features/property_details_feature/presentation/widgets/body_property_page.dart';
import 'package:flutter/material.dart';

class PropertyPage extends StatelessWidget {
  const PropertyPage({super.key, required this.propertyId});
  static String id = 'PropertyPage';
  final String propertyId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BodyPropertyPage(propertyId: propertyId),
    );
  }
}

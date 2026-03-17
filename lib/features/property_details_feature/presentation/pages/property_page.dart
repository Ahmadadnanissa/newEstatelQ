import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/body_property_page.dart';
import 'package:flutter/material.dart';

class PropertyPage extends StatelessWidget {
  const PropertyPage({super.key});
  static String id = 'PropertyPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: primaryColor, body: BodyPropertyPage());
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/providers/property_details_provider.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/base_property_details_widget.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_nearby_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyPropertyPage extends StatefulWidget {
  BodyPropertyPage({super.key, required this.propertyId});

  final String propertyId;

  @override
  State<BodyPropertyPage> createState() => _BodyPropertyPageState();
}

class _BodyPropertyPageState extends State<BodyPropertyPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<PropertyDetailsProvider>().getPropertyById(
        widget.propertyId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PropertyDetailsProvider>();
    final property = provider.property;

    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color titleColor = secondaryColor;
    final Color textColor = isDark ? darkSubtitleColor : Colors.grey;

    /// 🔴 LOADING STATE
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    /// 🔴 ERROR STATE
    if (provider.error != null) {
      return Center(child: Text(provider.error!));
    }

    /// 🔴 NULL STATE
    if (property == null) {
      return const SizedBox();
    }

    /// ================= EXTRA DETAILS =================
    List<String> details = [];

    if (property.floorNumber != null && property.floorNumber!.isNotEmpty) {
      details.add("Floor : ${property.floorNumber}");
    }

    if (property.heating.isNotEmpty) {
      details.add("Heater : ${property.heating}");
    }

    if (property.furnishing.isNotEmpty) {
      details.add("Furnished : ${property.furnishing}");
    }

    if (property.constructionYear.isNotEmpty) {
      details.add("Built : ${property.constructionYear}");
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// ================= BASE =================
            BasePropertyDetailsWidget(property: property),

            /// ================= MORE DETAILS =================
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: width * 0.02,
                horizontal: width * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Row(
                    children: [
                      CustomFont(
                        name: 'More Details',
                        fontColor: titleColor,
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),

                  SizedBox(height: width * 0.03),

                  /// CHIPS
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: details.map((e) {
                      return CustomNearbyWidget(name: e);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/services/visitor_local_storage.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/providers/property_details_provider.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/base_property_details_widget.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_nearby_widget.dart';
import 'package:estatelqapp/features/virtual_tour_feature/presentation/widgets/virtual_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyPropertyPage extends StatefulWidget {
  BodyPropertyPage({super.key, required this.propertyId});

  final String propertyId;

  @override
  State<BodyPropertyPage> createState() => _BodyPropertyPageState();
}

class _BodyPropertyPageState extends State<BodyPropertyPage> {
  DateTime? _propertyEntryTime;
  Future<void> _saveTimeSpent() async {
    if (_propertyEntryTime == null) {
      return;
    }

    final exitTime = DateTime.now();

    final difference = exitTime.difference(_propertyEntryTime!);

    await VisitorLocalStorageService.saveTimeInProperty(difference.inSeconds);
  }

  @override
  void initState() {
    super.initState();
    _propertyEntryTime = DateTime.now();
    Future.microtask(() {
      context.read<PropertyDetailsProvider>().getPropertyById(
        widget.propertyId,
      );
    });
  }

  @override
  void dispose() {
    _saveTimeSpent();

    super.dispose();
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
    if (property.nearByPlaces.isNotEmpty) {
      property.nearByPlaces.forEach((category, places) {
        if (places is List) {
          for (final place in places) {
            if (place is Map<String, dynamic>) {
              final name = place['name']?.toString() ?? '';
              final distance = place['distance_km']?.toString() ?? '';

              if (name.isNotEmpty) {
                details.add(
                  "Nearby Place:\n$name${distance.isNotEmpty ? ' ,$distance KM' : ''}",
                );
              }
            }
          }
        }
      });
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
                  const VirtualTourTestButton(),
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

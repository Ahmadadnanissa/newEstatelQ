import 'package:flutter/material.dart';
import '../../domain/entities/hotspot.dart';
import 'hotspot_marker.dart';

class InformationHotspot extends StatelessWidget {
  const InformationHotspot({
    super.key,
    required this.hotspot,
    required this.onTap,
    this.isSelected = false,
  });

  final TourHotspot hotspot;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return HotspotMarker(
      hotspot: hotspot,
      onTap: onTap,
      isSelected: isSelected,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import '../../domain/entities/hotspot.dart';

class PanoramaSurface extends StatelessWidget {
  const PanoramaSurface({
    super.key,
    required this.imageUrl,
    required this.hotspots,
    this.onPanoramaTap,
    this.onHotspotTap,
    this.interactive = true,
  });
  final String imageUrl;
  final List<TourHotspot> hotspots;
  final void Function(double yaw, double pitch)? onPanoramaTap;
  final void Function(TourHotspot hotspot)? onHotspotTap;
  final bool interactive;
  @override
  Widget build(BuildContext context) => PanoramaViewer(
    interactive: interactive,
    minZoom: 1,
    maxZoom: 4,
    latSegments: 32,
    lonSegments: 64,
    onTap: (longitude, latitude, _) => onPanoramaTap?.call(longitude, latitude),
    hotspots: hotspots
        .where((x) => x.isEnabled)
        .map(
          (hotspot) => Hotspot(
            longitude: hotspot.yaw,
            latitude: hotspot.pitch,
            width: 38,
            height: 38,
            widget: GestureDetector(
              onTap: () => onHotspotTap?.call(hotspot),
              child: const Icon(Icons.location_on, color: Colors.red, size: 36),
            ),
          ),
        )
        .toList(),
    child: Image.network(
      imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) =>
          loadingProgress == null
          ? child
          : const Center(child: CircularProgressIndicator()),
      errorBuilder: (context, error, stackTrace) =>
          const Center(child: Icon(Icons.broken_image)),
    ),
  );
}

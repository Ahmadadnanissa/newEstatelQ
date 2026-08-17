import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';
import 'package:estatelqapp/features/virtual_tour_feature/presentation/pages/virtual_tour_viewer_screen.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/room.dart';
import '../../domain/entities/virtual_tour.dart';

class PreviewTourScreen extends StatelessWidget {
  const PreviewTourScreen({
    super.key,
    required this.tour,
    required this.repository,
  });

  final VirtualTour tour;
  final VirtualTourRepository repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Tour'),
        backgroundColor: Colors.orange.withValues(alpha: 0.9),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.visibility, size: 16, color: Colors.white),
                const SizedBox(width: 4),
                Text(
                  'PREVIEW MODE',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: VirtualTourViewerScreen(repository: repository, tourId: tour.id),
      bottomNavigationBar: _PreviewBottomBar(
        tour: tour,
        repository: repository,
      ),
    );
  }
}

class _PreviewBottomBar extends StatelessWidget {
  const _PreviewBottomBar({required this.tour, required this.repository});

  final VirtualTour tour;
  final VirtualTourRepository repository;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.95),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tour.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    StreamBuilder<List<TourRoom>>(
                      stream: repository.watchRooms(tour.id),
                      builder: (context, snapshot) {
                        final roomCount = snapshot.data?.length ?? 0;
                        return Text(
                          '$roomCount rooms • ${tour.status.name.capitalize()}',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: 12,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
                label: const Text('Exit Preview'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _TipItem(icon: Icons.touch_app, text: 'Drag to look around'),
              const SizedBox(width: 16),
              _TipItem(icon: Icons.zoom_in, text: 'Pinch to zoom'),
              const SizedBox(width: 16),
              _TipItem(
                icon: Icons.location_on,
                text: 'Tap hotspots to navigate',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TipItem extends StatelessWidget {
  const _TipItem({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.white.withValues(alpha: 0.8)),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

extension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

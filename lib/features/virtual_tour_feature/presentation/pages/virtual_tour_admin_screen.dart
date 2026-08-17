import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/image_storage_repository.dart';
import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';
import 'package:estatelqapp/features/virtual_tour_feature/presentation/pages/preview_tour_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/room.dart';
import '../../domain/entities/virtual_tour.dart';

import '../providers/virtual_tour_controller.dart';
import 'tour_edit_screen.dart';
import 'room_edit_screen.dart';
import 'hotspot_editor_screen.dart';

class VirtualTourAdminScreen extends StatelessWidget {
  const VirtualTourAdminScreen({
    super.key,
    required this.repository,
    required this.imageStorage,
    required this.scopeId,
    required this.actorId,
  });
  final VirtualTourRepository repository;
  final ImageStorageRepository imageStorage;
  final String scopeId;
  final String actorId;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (_) => VirtualTourController(
      tours: repository,
      images: imageStorage,
      scopeId: scopeId,
      actorId: actorId,
    ),
    child: _ToursList(repository: repository, scopeId: scopeId),
  );
}

class _ToursList extends StatelessWidget {
  const _ToursList({required this.repository, required this.scopeId});
  final VirtualTourRepository repository;
  final String scopeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Virtual Tours'), elevation: 0),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToTourEdit(context),
        icon: const Icon(Icons.add),
        label: const Text('Create Tour'),
      ),
      body: StreamBuilder<List<VirtualTour>>(
        stream: repository.watchTours(scopeId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Unable to load tours: ${snapshot.error}'),
                ],
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final tours = snapshot.data!;
          if (tours.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.tour, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'No virtual tours yet',
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Create your first tour to get started',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: tours.length,
            itemBuilder: (context, index) {
              final tour = tours[index];
              return _TourCard(
                tour: tour,
                repository: repository,
                onTap: () => _navigateToRooms(context, tour),
                onEdit: () => _navigateToTourEdit(context, tour),
                onDelete: () => _confirmDeleteTour(context, tour),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _navigateToTourEdit(
    BuildContext context, [
    VirtualTour? tour,
  ]) async {
    final controller = context.read<VirtualTourController>();
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TourEditScreen(
          repository: repository,
          imageStorage: controller.images,
          tour: tour,
          scopeId: scopeId,
          actorId: controller.actorId,
        ),
      ),
    );
  }

  Future<void> _navigateToRooms(BuildContext context, VirtualTour tour) async {
    final controller = context.read<VirtualTourController>();
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _RoomsList(
          tour: tour,
          repository: repository,
          imageStorage: controller.images,
          scopeId: scopeId,
          actorId: controller.actorId,
        ),
      ),
    );
  }

  Future<void> _confirmDeleteTour(
    BuildContext context,
    VirtualTour tour,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: const Text('Delete Tour'),
        content: Text(
          'Are you sure you want to delete "${tour.title}"? This will also delete all rooms and hotspots. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialog, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      await context.read<VirtualTourController>().deleteTour(tour.id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tour deleted successfully')),
        );
      }
    }
  }
}

class _TourCard extends StatelessWidget {
  const _TourCard({
    required this.tour,
    required this.repository,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  final VirtualTour tour;
  final VirtualTourRepository repository;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              if (tour.coverImageUrl != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    tour.coverImageUrl!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.image, size: 32),
                    ),
                  ),
                )
              else
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.image, size: 32),
                ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tour.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${tour.roomCount} rooms',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    _StatusBadge(status: tour.status),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () async {
                  final controller = context.read<VirtualTourController>();
                  await controller.recalculateTourCounts(tour.id);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Counts recalculated')),
                    );
                  }
                },
                tooltip: 'Recalculate counts',
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: onEdit,
                tooltip: 'Edit tour',
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: onDelete,
                tooltip: 'Delete tour',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});
  final VirtualTourStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (status) {
      VirtualTourStatus.draft => ('Draft', Colors.orange),
      VirtualTourStatus.published => ('Published', Colors.green),
      VirtualTourStatus.archived => ('Archived', Colors.grey),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _RoomsList extends StatelessWidget {
  const _RoomsList({
    required this.tour,
    required this.repository,
    required this.imageStorage,
    required this.scopeId,
    required this.actorId,
  });

  final VirtualTour tour;
  final VirtualTourRepository repository;
  final ImageStorageRepository imageStorage;
  final String scopeId;
  final String actorId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tour.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.preview),
            onPressed: () => _navigateToPreview(context),
            tooltip: 'Preview tour',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addRoom(context),
        icon: const Icon(Icons.add_photo_alternate),
        label: const Text('Add Room'),
      ),
      body: StreamBuilder<List<TourRoom>>(
        stream: repository.watchRooms(tour.id),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final rooms = snapshot.data!;
          if (rooms.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.room, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'No rooms yet',
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add a 360° panorama to get started',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            );
          }
          return ReorderableListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: rooms.length,
            onReorder: (oldIndex, newIndex) async {
              if (newIndex > oldIndex) newIndex--;
              final ordered = [...rooms];
              final item = ordered.removeAt(oldIndex);
              ordered.insert(newIndex, item);
              await context.read<VirtualTourController>().reorderRooms(ordered);
            },
            itemBuilder: (_, i) {
              final room = rooms[i];
              return _RoomCard(
                key: ValueKey(room.id),
                room: room,
                repository: repository,
                onTap: () => _navigateToHotspotEditor(context, room),
                onEdit: () => _navigateToRoomEdit(context, room),
                onDelete: () => _confirmDeleteRoom(context, room),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _addRoom(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RoomEditScreen(
          tour: tour,
          repository: repository,
          imageStorage: imageStorage,
          scopeId: scopeId,
          actorId: actorId,
        ),
      ),
    );
  }

  Future<void> _navigateToRoomEdit(BuildContext context, TourRoom room) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RoomEditScreen(
          tour: tour,
          repository: repository,
          imageStorage: imageStorage,
          scopeId: scopeId,
          actorId: actorId,
          room: room,
        ),
      ),
    );
  }

  Future<void> _navigateToHotspotEditor(
    BuildContext context,
    TourRoom room,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HotspotEditorScreen(
          room: room,
          repository: repository,
          scopeId: scopeId,
          actorId: actorId,
        ),
      ),
    );
  }

  Future<void> _navigateToPreview(BuildContext context) async {
    final currentTour = await repository.getTour(tour.id);
    if (currentTour == null) return;

    if (!context.mounted) return;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            PreviewTourScreen(tour: currentTour, repository: repository),
      ),
    );
  }

  Future<void> _confirmDeleteRoom(BuildContext context, TourRoom room) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: const Text('Delete Room'),
        content: Text(
          'Are you sure you want to delete "${room.name}"? This will also delete all hotspots in this room. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialog, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      final controller = context.read<VirtualTourController>();
      await controller.deleteRoom(room);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Room deleted successfully')),
        );
      }
    }
  }
}

class _RoomCard extends StatelessWidget {
  const _RoomCard({
    super.key,
    required this.room,
    required this.repository,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  final TourRoom room;
  final VirtualTourRepository repository;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const Icon(Icons.drag_handle),
        title: Text(room.name),
        subtitle: Text('${room.hotspotCount} hotspots'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEdit,
              tooltip: 'Edit room',
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: onDelete,
              tooltip: 'Delete room',
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}

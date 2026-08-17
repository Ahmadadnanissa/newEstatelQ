import 'dart:math';
import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/image_storage_repository.dart';
import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';
import 'package:flutter/foundation.dart';
import '../../domain/entities/hotspot.dart';
import '../../domain/entities/room.dart';
import '../../domain/entities/virtual_tour.dart';

class VirtualTourController extends ChangeNotifier {
  VirtualTourController({
    required this.tours,
    required this.images,
    required this.scopeId,
    required this.actorId,
  });
  final VirtualTourRepository tours;
  final ImageStorageRepository images;
  final String scopeId, actorId;
  bool isSaving = false;
  String? error;
  String _id() =>
      '${DateTime.now().microsecondsSinceEpoch}_${Random.secure().nextInt(1 << 32)}';
  Future<void> _run(Future<void> Function() action) async {
    isSaving = true;
    error = null;
    notifyListeners();
    try {
      await action();
    } catch (e) {
      error = e.toString();
      rethrow;
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }

  Future<void> createTour({required String title, String? description}) => _run(
    () => tours.saveTour(
      VirtualTour(
        id: _id(),
        scopeId: scopeId,
        title: title.trim(),
        description: description?.trim(),
        status: VirtualTourStatus.draft,
        roomCount: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        createdBy: actorId,
      ),
    ),
  );
  Future<void> saveTour(VirtualTour tour) =>
      _run(() => tours.saveTour(tour.copyWith(updatedAt: DateTime.now())));
  Future<void> deleteTour(String id) => _run(() => tours.deleteTour(id));
  Future<void> addRoom({
    required VirtualTour tour,
    required String name,
    required Uint8List imageBytes,
    required String fileName,
    required int sortOrder,
    String? existingUrl,
    String? existingAssetId,
    int? existingWidth,
    int? existingHeight,
  }) => _run(() async {
    if (imageBytes.isEmpty && existingUrl != null) {
      // Use already uploaded image
      await tours.saveRoom(
        TourRoom(
          id: _id(),
          tourId: tour.id,
          scopeId: scopeId,
          name: name.trim(),
          panoramaUrl: existingUrl,
          storageAssetId: existingAssetId,
          sortOrder: sortOrder,
          panoramaWidth: existingWidth,
          panoramaHeight: existingHeight,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
    } else {
      // Upload new image
      final uploaded = await images.uploadPanorama(
        bytes: imageBytes,
        fileName: fileName,
      );
      await tours.saveRoom(
        TourRoom(
          id: _id(),
          tourId: tour.id,
          scopeId: scopeId,
          name: name.trim(),
          panoramaUrl: uploaded.secureUrl,
          storageAssetId: uploaded.assetId,
          sortOrder: sortOrder,
          panoramaWidth: uploaded.width,
          panoramaHeight: uploaded.height,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
    }
    // Update tour room count
    final currentTour = await tours.getTour(tour.id);
    if (currentTour != null) {
      await tours.saveTour(
        currentTour.copyWith(
          roomCount: currentTour.roomCount + 1,
          updatedAt: DateTime.now(),
        ),
      );
    }
  });
  Future<void> saveRoom(TourRoom room) =>
      _run(() => tours.saveRoom(room.copyWith(updatedAt: DateTime.now())));
  Future<void> deleteRoom(TourRoom room) => _run(() async {
    await tours.deleteRoom(room);
    // Update tour room count
    final currentTour = await tours.getTour(room.tourId);
    if (currentTour != null && currentTour.roomCount > 0) {
      await tours.saveTour(
        currentTour.copyWith(
          roomCount: currentTour.roomCount - 1,
          updatedAt: DateTime.now(),
        ),
      );
    }
  });
  Future<void> reorderRooms(List<TourRoom> rooms) =>
      _run(() => tours.reorderRooms(rooms));
  Future<void> saveHotspot({
    TourHotspot? existing,
    required TourRoom source,
    required double yaw,
    required double pitch,
    String? targetRoomId,
    String? label,
  }) => _run(() async {
    await tours.saveHotspot(
      existing?.copyWith(
            yaw: yaw,
            pitch: pitch,
            targetRoomId: targetRoomId,
            label: label,
            updatedAt: DateTime.now(),
          ) ??
          TourHotspot(
            id: _id(),
            tourId: source.tourId,
            scopeId: scopeId,
            sourceRoomId: source.id,
            targetRoomId: targetRoomId,
            label: label,
            yaw: yaw,
            pitch: pitch,
            type: HotspotType.navigation,
            isEnabled: true,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
    );
    // Update room hotspot count if creating new hotspot
    if (existing == null) {
      final rooms = await tours.watchRooms(source.tourId).first;
      final room = rooms.where((r) => r.id == source.id).firstOrNull;
      if (room != null) {
        await tours.saveRoom(
          room.copyWith(
            hotspotCount: room.hotspotCount + 1,
            updatedAt: DateTime.now(),
          ),
        );
      }
    }
  });
  Future<void> deleteHotspot(TourHotspot hotspot) => _run(() async {
    await tours.deleteHotspot(hotspot);
    // Update room hotspot count
    final rooms = await tours.watchRooms(hotspot.tourId).first;
    final room = rooms.where((r) => r.id == hotspot.sourceRoomId).firstOrNull;
    if (room != null && room.hotspotCount > 0) {
      await tours.saveRoom(
        room.copyWith(
          hotspotCount: room.hotspotCount - 1,
          updatedAt: DateTime.now(),
        ),
      );
    }
  });

  Future<void> recalculateTourCounts(String tourId) => _run(() async {
    // Recalculate room count
    final rooms = await tours.watchRooms(tourId).first;
    final tour = await tours.getTour(tourId);
    if (tour != null && tour.roomCount != rooms.length) {
      await tours.saveTour(
        tour.copyWith(roomCount: rooms.length, updatedAt: DateTime.now()),
      );
    }

    // Recalculate hotspot counts for each room
    for (final room in rooms) {
      final hotspots = await tours.watchHotspots(room.id).first;
      if (room.hotspotCount != hotspots.length) {
        await tours.saveRoom(
          room.copyWith(
            hotspotCount: hotspots.length,
            updatedAt: DateTime.now(),
          ),
        );
      }
    }
  });
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

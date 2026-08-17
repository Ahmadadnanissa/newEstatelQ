import 'dart:typed_data';

import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/image_storage_repository.dart';
import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';

import '../entities/room.dart';
import '../entities/virtual_tour.dart';

class AddRoom {
  AddRoom(this.tourRepository, this.imageRepository);
  final VirtualTourRepository tourRepository;
  final ImageStorageRepository imageRepository;

  Future<void> call({
    required VirtualTour tour,
    required String name,
    required Uint8List imageBytes,
    required String fileName,
    required String scopeId,
    required int sortOrder,
    void Function(double progress)? onProgress,
  }) async {
    final uploaded = await imageRepository.uploadPanorama(
      bytes: imageBytes,
      fileName: fileName,
      onProgress: onProgress,
    );

    final room = TourRoom(
      id: _generateId(),
      tourId: tour.id,
      scopeId: scopeId,
      name: name.trim(),
      panoramaUrl: uploaded.secureUrl,
      storageAssetId: uploaded.assetId,
      sortOrder: sortOrder,
      panoramaWidth: uploaded.width,
      panoramaHeight: uploaded.height,
      hotspotCount: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await tourRepository.saveRoom(room);

    // Update tour room count
    final currentTour = await tourRepository.getTour(tour.id);
    if (currentTour != null) {
      await tourRepository.saveTour(
        currentTour.copyWith(
          roomCount: currentTour.roomCount + 1,
          updatedAt: DateTime.now(),
        ),
      );
    }
  }

  String _generateId() =>
      '${DateTime.now().microsecondsSinceEpoch}_${_randomInt()}';
  int _randomInt() => DateTime.now().millisecond + 1000;
}

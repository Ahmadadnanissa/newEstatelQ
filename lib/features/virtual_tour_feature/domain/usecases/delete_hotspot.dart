import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';

import '../entities/hotspot.dart';

class DeleteHotspot {
  DeleteHotspot(this.repository);
  final VirtualTourRepository repository;

  Future<void> call(TourHotspot hotspot) async {
    await repository.deleteHotspot(hotspot);

    // Update room hotspot count
    final rooms = await repository.watchRooms(hotspot.tourId).first;
    final room = rooms.where((r) => r.id == hotspot.sourceRoomId).firstOrNull;
    if (room != null && room.hotspotCount > 0) {
      await repository.saveRoom(
        room.copyWith(
          hotspotCount: room.hotspotCount - 1,
          updatedAt: DateTime.now(),
        ),
      );
    }
  }
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

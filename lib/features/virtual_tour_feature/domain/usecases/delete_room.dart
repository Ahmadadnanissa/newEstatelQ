import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';

import '../entities/room.dart';

class DeleteRoom {
  DeleteRoom(this.repository);
  final VirtualTourRepository repository;

  Future<void> call(TourRoom room) async {
    await repository.deleteRoom(room);

    // Update tour room count
    final tour = await repository.getTour(room.tourId);
    if (tour != null && tour.roomCount > 0) {
      await repository.saveTour(
        tour.copyWith(roomCount: tour.roomCount - 1, updatedAt: DateTime.now()),
      );
    }
  }
}

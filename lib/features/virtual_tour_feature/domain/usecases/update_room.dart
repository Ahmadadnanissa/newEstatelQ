import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';

import '../entities/room.dart';

class UpdateRoom {
  UpdateRoom(this.repository);
  final VirtualTourRepository repository;

  Future<void> call(TourRoom room) async {
    final updated = room.copyWith(updatedAt: DateTime.now());
    await repository.saveRoom(updated);
  }
}

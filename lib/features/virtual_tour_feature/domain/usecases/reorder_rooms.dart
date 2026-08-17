import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';

import '../entities/room.dart';

class ReorderRooms {
  ReorderRooms(this.repository);
  final VirtualTourRepository repository;

  Future<void> call(List<TourRoom> rooms) async {
    await repository.reorderRooms(rooms);
  }
}

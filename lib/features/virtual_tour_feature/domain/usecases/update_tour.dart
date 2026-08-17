import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';

import '../entities/virtual_tour.dart';

class UpdateTour {
  UpdateTour(this.repository);
  final VirtualTourRepository repository;

  Future<void> call(VirtualTour tour) async {
    final updated = tour.copyWith(updatedAt: DateTime.now());
    await repository.saveTour(updated);
  }
}

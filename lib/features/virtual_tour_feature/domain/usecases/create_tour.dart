import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';

import '../entities/virtual_tour.dart';

class CreateTour {
  CreateTour(this.repository);
  final VirtualTourRepository repository;

  Future<void> call({
    required String title,
    required String scopeId,
    required String actorId,
    String? description,
  }) async {
    final tour = VirtualTour(
      id: _generateId(),
      scopeId: scopeId,
      title: title.trim(),
      description: description?.trim(),
      status: VirtualTourStatus.draft,
      roomCount: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      createdBy: actorId,
    );
    await repository.saveTour(tour);
  }

  String _generateId() =>
      '${DateTime.now().microsecondsSinceEpoch}_${_randomInt()}';
  int _randomInt() => DateTime.now().millisecond + 1000;
}

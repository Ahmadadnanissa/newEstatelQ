import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';

class DeleteTour {
  DeleteTour(this.repository);
  final VirtualTourRepository repository;

  Future<void> call(String tourId) async {
    await repository.deleteTour(tourId);
  }
}

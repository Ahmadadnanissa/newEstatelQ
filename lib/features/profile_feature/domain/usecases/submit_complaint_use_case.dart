import '../../data/repositories/support_repository.dart';

class SubmitComplaintUseCase {
  final SupportRepository repository;

  SubmitComplaintUseCase(this.repository);

  Future<void> execute({required String id, required String message}) {
    return repository.submitComplaint(id: id, message: message);
  }
}

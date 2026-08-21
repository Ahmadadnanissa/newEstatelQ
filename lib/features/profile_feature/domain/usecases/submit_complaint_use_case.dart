import '../../data/repositories/support_repository.dart';

class SubmitComplaintUseCase {
  final SupportRepository repository;

  SubmitComplaintUseCase(this.repository);

  Future<void> execute({
    required String issueMessage,
    required String complaintTypeId,
  }) {
    return repository.submitComplaint(
      issueMessage: issueMessage,
      complaintTypeId: complaintTypeId,
    );
  }
}

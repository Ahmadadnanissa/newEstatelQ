import '../../data/models/complaint_type.dart';
import '../../data/repositories/support_repository.dart';

class GetComplaintTypesUseCase {
  final SupportRepository repository;

  GetComplaintTypesUseCase(this.repository);

  Future<List<ComplaintType>> execute() {
    return repository.getComplaintTypes();
  }
}

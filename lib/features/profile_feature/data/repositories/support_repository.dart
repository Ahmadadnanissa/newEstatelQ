import '../datasources/support_remote_data_source.dart';
import '../models/complaint_type.dart';

class SupportRepository {
  final SupportRemoteDataSource remote;

  SupportRepository(this.remote);

  Future<List<ComplaintType>> getComplaintTypes() {
    return remote.getComplaintTypes();
  }

  Future<void> submitComplaint({
    required String issueMessage,
    required String complaintTypeId,
  }) {
    return remote.submitComplaint(
      issueMessage: issueMessage,
      complaintTypeId: complaintTypeId,
    );
  }
}

import '../datasources/support_remote_data_source.dart';

class SupportRepository {
  final SupportRemoteDataSource remote;

  SupportRepository(this.remote);

  Future<void> submitComplaint({required String id, required String message}) {
    return remote.submitComplaint(id: id, message: message);
  }
}

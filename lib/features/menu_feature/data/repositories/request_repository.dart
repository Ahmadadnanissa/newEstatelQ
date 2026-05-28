import '../datasources/request_remote_data_source.dart';
import '../models/request_model.dart';

class RequestRepository {
  final RequestRemoteDataSource remote;

  RequestRepository(this.remote);

  Future<String> sendRequest({
    required RequestModel request,
    required String? token,
  }) {
    return remote.sendRequest(request: request, token: token);
  }
}

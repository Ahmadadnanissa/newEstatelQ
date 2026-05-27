import 'package:estatelqapp/features/menu_feature/data/datasources/request_remote_data_source.dart';
import 'package:estatelqapp/features/menu_feature/data/models/request_model.dart';

class RequestRepository {
  final RequestRemoteDataSource remote;

  RequestRepository(this.remote);

  Future<void> sendRequest({
    required RequestModel request,
    required String token,
  }) {
    return remote.sendRequest(request: request, token: token);
  }
}

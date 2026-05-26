import 'package:estatelqapp/features/profile_feature/data/models/client_model..dart';

import '../datasources/client_remote_data_source.dart';

class ClientRepository {
  final ClientRemoteDataSource remote;

  ClientRepository(this.remote);

  Future<ClientModel> getClient(String id, String userType) {
    return remote.getClient(id, userType);
  }
}

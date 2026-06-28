import 'package:estatelqapp/features/profile_feature/data/models/client_model..dart';

import '../datasources/client_remote_data_source.dart';

class ClientRepository {
  final ClientRemoteDataSource remote;

  ClientRepository(this.remote);

  Future<ClientModel> getClient(String token) {
    return remote.getClient(token);
  }

  Future<void> updateProfile({
    required String token,
    String? name,
    String? phone,
    String? image,
    String? location,
  }) {
    return remote.updateProfile(
      token: token,
      name: name,
      phone: phone,
      image: image,
      location: location,
    );
  }
}

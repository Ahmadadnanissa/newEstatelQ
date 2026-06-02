import 'package:estatelqapp/features/profile_feature/data/models/client_model..dart';

import '../datasources/client_remote_data_source.dart';

class ClientRepository {
  final ClientRemoteDataSource remote;

  ClientRepository(this.remote);

  Future<ClientModel> getClient(String token) {
    return remote.getClient(token);
  }

  Future<void> updateAddress({
    required String id,
    required String token,
    required double latitude,
    required double longitude,
  }) {
    return remote.updateAddress(
      id: id,
      token: token,
      latitude: latitude,
      longitude: longitude,
    );
  }

  Future<void> updateProfile({
    required String id,
    required String token,
    required String name,
    required String email,
    required String phone,
    required String image,
    required String location,
  }) {
    return remote.updateProfile(
      id: id,
      token: token,
      name: name,
      email: email,
      phone: phone,
      image: image,
      location: location,
    );
  }
}

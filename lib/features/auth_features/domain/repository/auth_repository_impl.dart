

import 'package:estatelqapp/features/auth_features/data/datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  Future<bool> loginWithGoogle(String idToken) async {
    return await remote.sendGoogleToken(idToken);
  }
}
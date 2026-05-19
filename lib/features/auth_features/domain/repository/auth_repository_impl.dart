import 'package:estatelqapp/features/auth_features/data/datasources/auth_remote_data_source.dart';
import 'package:estatelqapp/features/auth_features/data/models/login_response_model.dart';
import 'package:estatelqapp/features/auth_features/data/models/sign_up_response_model.dart';

class AuthRepositoryImpl {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  // Future<bool> loginWithGoogle(String idToken) async {
  //   return await remote.sendGoogleToken(idToken);
  // }

  Future<LoginResponseModel> login(String email, String password) async {
    return await remote.login(email, password);
  }

  Future<SignupResponseModel> signup(
    String name,
    String email,
    String password,
    String passwordConfirm,
  ) async {
    return await remote.signup(name, email, password, passwordConfirm);
  }

  Future<LoginResponseModel> verifyOtp(String email, String otp) async {
    return await remote.verifyOtp(email, otp);
  }

  Future<void> sendOtp(String email) async {
    return await remote.sendOtp(email);
  }
}

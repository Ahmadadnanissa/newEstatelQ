import 'package:estatelqapp/features/auth_features/data/datasources/auth_remote_data_source.dart';
import 'package:estatelqapp/features/auth_features/data/models/login_response_model.dart';
import 'package:estatelqapp/features/auth_features/data/models/sign_up_response_model.dart';
import 'package:estatelqapp/features/forget_password_features/data/models/forget_passowrd_response_model.dart';
import 'package:estatelqapp/features/forget_password_features/data/models/reset_password_response_model.dart';
import 'package:estatelqapp/features/forget_password_features/data/models/verify_for_go_to_passowrd_otp_veriffy_response.dart';

class AuthRepositoryImpl {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

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

  Future<String> sendOtp(String email) async {
    return await remote.sendOtp(email);
  }

  Future<String> logout(String token) {
    return remote.logout(token);
  }

  Future<ForgotPasswordResponseModel> forgotPassword(String email) async {
    return await remote.forgotPassword(email);
  }

  Future<VerifyForgotPasswordOtpModel> verifyForgotPasswordOtp(
    String email,
    String otp,
  ) async {
    return await remote.verifyForgotPasswordOtp(email, otp);
  }

  Future<ResetPasswordResponseModel> resetPassword(
    String password,
    String passwordConfirm,
    String resetToken,
  ) async {
    return await remote.resetPassword(password, passwordConfirm, resetToken);
  }
}

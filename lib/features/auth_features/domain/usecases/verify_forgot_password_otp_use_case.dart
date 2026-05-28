import 'package:estatelqapp/features/auth_features/domain/repository/auth_repository_impl.dart';
import 'package:estatelqapp/features/forget_password_features/data/models/verify_for_go_to_passowrd_otp_veriffy_response.dart';

class VerifyForgotPasswordOtpUseCase {
  final AuthRepositoryImpl repository;

  VerifyForgotPasswordOtpUseCase(this.repository);

  Future<VerifyForgotPasswordOtpModel> execute(String email, String otp) async {
    return await repository.verifyForgotPasswordOtp(email, otp);
  }
}

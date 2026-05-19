import 'package:estatelqapp/features/auth_features/data/models/login_response_model.dart';
import 'package:estatelqapp/features/auth_features/domain/repository/auth_repository_impl.dart';

class VerifyOtpUseCase {
  final AuthRepositoryImpl repository;

  VerifyOtpUseCase(this.repository);

  Future<LoginResponseModel> execute(String email, String otp) async {
    return await repository.verifyOtp(email, otp);
  }
}

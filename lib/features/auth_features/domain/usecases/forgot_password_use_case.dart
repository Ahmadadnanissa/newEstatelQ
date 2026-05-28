import 'package:estatelqapp/features/auth_features/domain/repository/auth_repository_impl.dart';
import 'package:estatelqapp/features/forget_password_features/data/models/forget_passowrd_response_model.dart';

class ForgotPasswordUseCase {
  final AuthRepositoryImpl repository;

  ForgotPasswordUseCase(this.repository);

  Future<ForgotPasswordResponseModel> execute(String email) async {
    return await repository.forgotPassword(email);
  }
}

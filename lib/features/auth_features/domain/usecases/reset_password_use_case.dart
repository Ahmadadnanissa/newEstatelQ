import 'package:estatelqapp/features/auth_features/domain/repository/auth_repository_impl.dart';
import 'package:estatelqapp/features/forget_password_features/data/models/reset_password_response_model.dart';

class ResetPasswordUseCase {
  final AuthRepositoryImpl repository;

  ResetPasswordUseCase(this.repository);

  Future<ResetPasswordResponseModel> execute(
    String password,
    String passwordConfirm,
    String resetToken,
  ) async {
    return await repository.resetPassword(
      password,
      passwordConfirm,
      resetToken,
    );
  }
}

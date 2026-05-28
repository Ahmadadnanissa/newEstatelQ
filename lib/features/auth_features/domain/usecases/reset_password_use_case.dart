import 'package:estatelqapp/features/auth_features/domain/repository/auth_repository_impl.dart';

class ResetPasswordUseCase {
  final AuthRepositoryImpl repository;

  ResetPasswordUseCase(this.repository);

  Future<void> execute(
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

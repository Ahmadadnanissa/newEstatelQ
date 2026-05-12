import 'package:estatelqapp/features/auth_features/domain/repository/auth_repository_impl.dart';

class GoogleLoginUseCase {
  final AuthRepositoryImpl repository;

  GoogleLoginUseCase(this.repository);

  Future<bool> execute(String idToken) async {
    return await repository.loginWithGoogle(idToken);
  }
}

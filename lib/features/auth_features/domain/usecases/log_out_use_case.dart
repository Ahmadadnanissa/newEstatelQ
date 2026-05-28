import 'package:estatelqapp/features/auth_features/domain/repository/auth_repository_impl.dart';

class LogoutUseCase {
  final AuthRepositoryImpl repository;

  LogoutUseCase(this.repository);

  Future<String> execute(String id, String token) {
    return repository.logout(id, token);
  }
}

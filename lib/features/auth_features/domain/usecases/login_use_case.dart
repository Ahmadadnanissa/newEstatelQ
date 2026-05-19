import 'package:estatelqapp/features/auth_features/data/models/login_response_model.dart';

import 'package:estatelqapp/features/auth_features/domain/repository/auth_repository_impl.dart';

class LoginUseCase {
  final AuthRepositoryImpl repository;

  LoginUseCase(this.repository);

  Future<LoginResponseModel> execute(String email, String password) async {
    return await repository.login(email, password);
  }
}

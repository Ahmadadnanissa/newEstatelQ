import 'package:estatelqapp/features/auth_features/data/models/sign_up_response_model.dart';
import 'package:estatelqapp/features/auth_features/domain/repository/auth_repository_impl.dart';

class SignupUseCase {
  final AuthRepositoryImpl repository;

  SignupUseCase(this.repository);

  Future<SignupResponseModel> execute(
    String name,
    String email,
    String password,
    String passwordConfirm,
  ) async {
    return await repository.signup(name, email, password, passwordConfirm);
  }
}

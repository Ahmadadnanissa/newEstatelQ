import 'package:estatelqapp/features/auth_features/data/repositories/auth_repository.dart';

class GoogleSignInUseCase {
  final AuthRepository repository;

  GoogleSignInUseCase(this.repository);

  Future<String?> execute() async {
    return await repository.signInWithGoogle();
  }
}

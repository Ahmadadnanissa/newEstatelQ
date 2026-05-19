import 'package:estatelqapp/features/auth_features/domain/repository/auth_repository_impl.dart';

class SendOtpUseCase {
  final AuthRepositoryImpl repository;

  SendOtpUseCase(this.repository);

  Future<void> execute(String email) async {
    return repository.sendOtp(email);
  }
}

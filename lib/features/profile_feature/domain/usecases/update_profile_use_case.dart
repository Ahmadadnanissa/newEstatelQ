import 'package:estatelqapp/features/profile_feature/data/repositories/client_repository.dart';

class UpdateProfileUseCase {
  final ClientRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<void> execute({
    required String id,
    required String token,
    required String name,
    required String email,
    required String phone,
    required String image,
    required String location,
  }) {
    return repository.updateProfile(
      id: id,
      token: token,
      name: name,
      email: email,
      phone: phone,
      image: image,
      location: location,
    );
  }
}

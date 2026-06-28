import 'package:estatelqapp/features/profile_feature/data/repositories/client_repository.dart';

class UpdateProfileUseCase {
  final ClientRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<void> execute({
    required String token,
    String? name,
    String? phone,
    String? image,
    String? location,
  }) {
    return repository.updateProfile(
      token: token,
      name: name,
      phone: phone,
      image: image,
      location: location,
    );
  }
}

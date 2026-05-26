import 'package:estatelqapp/features/profile_feature/data/repositories/client_repository.dart';

class UpdateAddressUseCase {
  final ClientRepository repository;

  UpdateAddressUseCase(this.repository);

  Future<void> execute({
    required String id,
    required String token,
    required double latitude,
    required double longitude,
  }) {
    return repository.updateAddress(
      id: id,
      token: token,
      latitude: latitude,
      longitude: longitude,
    );
  }
}

import 'package:estatelqapp/features/profile_feature/data/models/client_model..dart';
import 'package:estatelqapp/features/profile_feature/data/repositories/client_repository.dart';

class GetClientUseCase {
  final ClientRepository repository;

  GetClientUseCase(this.repository);

  Future<ClientModel> execute(String token) {
    return repository.getClient(token);
  }
}

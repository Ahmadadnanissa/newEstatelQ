import 'package:estatelqapp/features/menu_feature/data/models/request_model.dart';
import 'package:estatelqapp/features/menu_feature/data/repositories/request_repository.dart';

class SendRequestUseCase {
  final RequestRepository repository;

  SendRequestUseCase(this.repository);

  Future<void> execute({required RequestModel request, required String token}) {
    return repository.sendRequest(request: request, token: token);
  }
}

import 'package:estatelqapp/features/auth_features/data/models/visitor_model.dart';
import 'package:estatelqapp/features/auth_features/data/repositories/visitor_repository.dart';

class CreateVisitorUseCase {
  final VisitorRepository repository;

  CreateVisitorUseCase(this.repository);

  Future<VisitorModel> execute() async {
    return await repository.createVisitor();
  }
}

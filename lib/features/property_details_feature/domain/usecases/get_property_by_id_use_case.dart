import 'package:estatelqapp/features/property_details_feature/data/models/property_model.dart';
import 'package:estatelqapp/features/property_details_feature/data/repositories/property_details_repository_impl.dart';

class GetPropertyByIdUseCase {
  final PropertyDetailsRepositoryImpl repository;

  GetPropertyByIdUseCase(this.repository);

  Future<PropertyModel> execute(String id) async {
    return await repository.getPropertyById(id);
  }
}

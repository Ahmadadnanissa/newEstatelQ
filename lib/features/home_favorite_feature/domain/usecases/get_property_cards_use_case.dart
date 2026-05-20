import 'package:estatelqapp/features/home_favorite_feature/data/models/filter_property_model.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/repositories/property_card_repository_impl.dart';

class GetPropertiesCardUseCase {
  final PropertyCardRepositoryImpl repository;

  GetPropertiesCardUseCase(this.repository);

  Future<List<PropertyCardModel>> execute({
    required int page,

    required int limit,
    FilterPropertyModel? filter,
  }) async {
    return await repository.getProperties(
      page: page,
      limit: limit,
      filter: filter,
    );
  }
}

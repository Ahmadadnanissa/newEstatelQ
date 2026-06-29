import 'package:estatelqapp/features/home_favorite_feature/data/models/filter_property_model.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/repositories/favorite_repository.dart';

class GetFavoritePropertiesUseCase {
  final FavoriteRepository repository;

  GetFavoritePropertiesUseCase(this.repository);

  Future<List<PropertyCardModel>> execute({
    int page = 1,
    int limit = 10,
    FilterPropertyModel? filter,
  }) async {
    return await repository.getFavoriteProperties(
      page: page,
      limit: limit,
      filter: filter,
    );
  }
}

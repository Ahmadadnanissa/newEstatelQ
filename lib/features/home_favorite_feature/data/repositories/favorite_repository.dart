import 'package:estatelqapp/features/home_favorite_feature/data/datasources/favorite_remote_data_source.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/filter_property_model.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';

class FavoriteRepository {
  final FavoriteRemoteDataSource remote;

  FavoriteRepository(this.remote);

  Future<List<PropertyCardModel>> getFavoriteProperties({
    int page = 1,
    int limit = 10,
    FilterPropertyModel? filter,
  }) async {
    return await remote.getFavoriteProperties(
      page: page,
      limit: limit,
      filter: filter,
    );
  }

  Future<void> addToFavorite(String propertyId) async {
    return await remote.addToFavorite(propertyId);
  }
}

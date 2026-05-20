import 'package:estatelqapp/features/home_favorite_feature/data/datasources/favorite_remote_data_source.dart';

import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';

class FavoriteRepository {
  final FavoriteRemoteDataSource remote;

  FavoriteRepository(this.remote);

  Future<List<PropertyCardModel>> getFavoriteProperties() async {
    return await remote.getFavoriteProperties();
  }

  Future<void> addToFavorite(String propertyId) async {
    return await remote.addToFavorite(propertyId);
  }
}

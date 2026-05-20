import 'package:estatelqapp/features/home_favorite_feature/data/datasources/property_card_data_source.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/filter_property_model.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';

class PropertyCardRepositoryImpl {
  final PropertyCardRemoteDataSource remote;

  PropertyCardRepositoryImpl(this.remote);

  Future<List<PropertyCardModel>> getProperties({
    required int page,

    required int limit,
    FilterPropertyModel? filter,
  }) async {
    return await remote.getProperties(page: page, limit: limit, filter: filter);
  }
}

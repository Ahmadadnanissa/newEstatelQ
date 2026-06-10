import 'package:estatelqapp/features/home_favorite_feature/data/datasources/property_card_data_source.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/filter_property_model.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';

class PropertyCardRepositoryImpl {
  final PropertyCardRemoteDataSource remote;

  PropertyCardRepositoryImpl(this.remote);

  Future<List<PropertyCardModel>> getProperties({
    required int limit,
    String? cursor,
    FilterPropertyModel? filter,
  }) async {
    final isSearch = (filter?.q != null && filter!.q!.isNotEmpty);

    if (isSearch) {
      return await remote.searchProperties(
        limit: limit,
        cursor: cursor,
        filter: filter,
      );
    }

    return await remote.getProperties(
      limit: limit,
      cursor: cursor,
      filter: filter,
    );
  }
}

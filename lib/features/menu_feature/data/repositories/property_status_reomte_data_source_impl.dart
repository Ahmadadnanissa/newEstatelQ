import 'package:estatelqapp/features/menu_feature/data/datasources/property_status_remote_data_source.dart';

import 'package:estatelqapp/features/menu_feature/domain/entity/property_activity.dart';

import 'package:estatelqapp/features/menu_feature/domain/repository/property_status_repository.dart';

class PropertyStatusRepositoryImpl implements PropertyStatusRepository {
  final PropertyStatusRemoteDataSource remoteDataSource;

  PropertyStatusRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<PropertyActivity>> getActivities(
    String propertyId,

    String token,
  ) async {
    return await remoteDataSource.getActivities(propertyId, token);
  }
}

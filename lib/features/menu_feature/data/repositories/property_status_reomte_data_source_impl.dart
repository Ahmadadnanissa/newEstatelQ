import 'package:estatelqapp/features/menu_feature/data/datasources/property_status_remote_data_source.dart';
import 'package:estatelqapp/features/menu_feature/domain/entity/property_activity.dart';

class PropertyStatusRepositoryImpl {
  final PropertyStatusRemoteDataSource remoteDataSource;

  PropertyStatusRepositoryImpl(this.remoteDataSource);

  Future<List<PropertyActivity>> getActivities(String propertyId) async {
    return await remoteDataSource.getActivities(propertyId);
  }
}

import 'package:estatelqapp/features/property_details_feature/data/datasources/property_details_remote_data_source.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/property_model.dart';

class PropertyDetailsRepositoryImpl {
  final PropertyDetailsRemoteDataSource remote;

  PropertyDetailsRepositoryImpl(this.remote);

  Future<PropertyModel> getPropertyById(String id) async {
    return await remote.getPropertyById(id);
  }
}

import 'package:estatelqapp/features/menu_feature/domain/entity/property_activity.dart';

import 'package:estatelqapp/features/menu_feature/domain/repository/property_status_repository.dart';

class GetPropertyActivities {
  final PropertyStatusRepository repository;

  GetPropertyActivities(this.repository);

  Future<List<PropertyActivity>> call(String propertyId, String token) {
    return repository.getActivities(propertyId, token);
  }
}

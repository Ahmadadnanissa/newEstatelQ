import 'package:estatelqapp/features/menu_feature/domain/entity/property_activity.dart';

abstract class PropertyStatusRepository {
  Future<List<PropertyActivity>> getActivities(String propertyId, String token);
}

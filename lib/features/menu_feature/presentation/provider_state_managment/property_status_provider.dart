import 'package:estatelqapp/features/menu_feature/data/repositories/property_status_reomte_data_source_impl.dart';
import 'package:estatelqapp/features/menu_feature/domain/entity/property_activity.dart';
import 'package:flutter/material.dart';

class PropertyStatusProvider extends ChangeNotifier {
  final PropertyStatusRepositoryImpl repo;

  PropertyStatusProvider(this.repo);

  List<PropertyActivity> activities = [];
  bool isLoading = false;

  Future<void> getActivities(String propertyId) async {
    isLoading = true;
    notifyListeners();

    activities = await repo.getActivities(propertyId);

    isLoading = false;
    notifyListeners();
  }
}

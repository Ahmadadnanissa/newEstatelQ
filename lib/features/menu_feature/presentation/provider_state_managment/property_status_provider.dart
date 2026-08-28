import 'package:estatelqapp/core/services/local_storage_service.dart';

import 'package:estatelqapp/features/menu_feature/domain/entity/property_activity.dart';

import 'package:estatelqapp/features/menu_feature/domain/usecases/get_property_activities.dart';

import 'package:flutter/material.dart';

class PropertyStatusProvider extends ChangeNotifier {
  final GetPropertyActivities getPropertyActivities;

  PropertyStatusProvider(this.getPropertyActivities);

  List<PropertyActivity> activities = [];

  bool isLoading = false;

  String? error;

  Future<void> getActivities(String propertyId) async {
    try {
      isLoading = true;

      error = null;

      notifyListeners();

      final token = LocalStorageService.getToken() ?? "";

      activities = await getPropertyActivities(propertyId, token);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }
}

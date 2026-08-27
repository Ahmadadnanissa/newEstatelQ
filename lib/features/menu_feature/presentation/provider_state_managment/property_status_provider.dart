import 'package:estatelqapp/features/menu_feature/domain/entity/property_activity.dart';
import 'package:flutter/material.dart';

class PropertyStatusProvider extends ChangeNotifier {
  PropertyStatusProvider();

  List<PropertyActivity> activities = [];

  bool isLoading = false;

  String? error;

  Future<void> getActivities(String propertyId) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      // Mock Data
      await Future.delayed(const Duration(milliseconds: 500));

      activities = [
        PropertyActivity(
          title: 'Deal Started',
          description:
              'Someone is interested in your property and has started a conversation.',
          date: DateTime.now().subtract(const Duration(days: 2)),
          status: 'started',
        ),
        PropertyActivity(
          title: 'Deal Failed',
          description:
              'Unfortunately, the client was not serious. We will try again.',
          date: DateTime.now(),
          status: 'failed',
        ),
        PropertyActivity(
          title: 'Deal Started',
          description:
              'Someone is interested in your property and has started a conversation.',
          date: DateTime.now().subtract(const Duration(days: 2)),
          status: 'started',
        ),
        PropertyActivity(
          title: 'Deal Completed',
          description:
              'Congratulations! The deal has been completed successfully.',
          date: DateTime.now().subtract(const Duration(days: 1)),
          status: 'success',
        ),
      ];
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

import 'package:estatelqapp/features/property_details_feature/data/models/property_model.dart';
import 'package:estatelqapp/features/property_details_feature/domain/usecases/get_property_by_id_use_case.dart';
import 'package:flutter/material.dart';

class PropertyDetailsProvider extends ChangeNotifier {
  final GetPropertyByIdUseCase useCase;

  PropertyDetailsProvider(this.useCase);

  PropertyModel? property;

  bool isLoading = false;

  String? error;

  Future<void> getPropertyById(String id) async {
    try {
      error = null;

      isLoading = true;

      notifyListeners();

      property = await useCase.execute(id);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }
}

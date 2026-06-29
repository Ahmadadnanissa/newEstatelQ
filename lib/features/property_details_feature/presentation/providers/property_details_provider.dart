import 'package:flutter/material.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/property_model.dart';
import 'package:estatelqapp/features/property_details_feature/domain/usecases/get_property_by_id_use_case.dart';

class PropertyDetailsProvider extends ChangeNotifier {
  final GetPropertyByIdUseCase useCase;

  PropertyDetailsProvider(this.useCase);

  PropertyModel? property;

  bool isLoading = false;
  String? error;

  Future<void> getPropertyById(String id) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final result = await useCase.execute(id);
      property = result;
    } catch (e) {
      error = e.toString();
      property = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    property = null;
    error = null;
    isLoading = false;
    notifyListeners();
  }
}

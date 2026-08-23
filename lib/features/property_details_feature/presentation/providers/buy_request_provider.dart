import 'package:estatelqapp/features/property_details_feature/domain/usecases/create_buy_request_use_case.dart';
import 'package:flutter/material.dart';

class BuyRequestProvider extends ChangeNotifier {
  final CreateBuyRequestUseCase createBuyRequestUseCase;

  BuyRequestProvider(this.createBuyRequestUseCase);

  bool isLoading = false;

  String? error;

  String? successMessage;

  Future<void> createBuyRequest({
    required String type,
    String? message,
    required String propertyId,
  }) async {
    try {
      error = null;
      successMessage = null;

      isLoading = true;

      notifyListeners();

      final result = await createBuyRequestUseCase.execute(
        type: type,
        message: message,
        propertyId: propertyId,
      );

      successMessage = result.message;
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;

    notifyListeners();
  }
}

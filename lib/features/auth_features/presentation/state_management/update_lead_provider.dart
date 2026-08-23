import 'package:estatelqapp/features/auth_features/domain/usecases/update_lead_use_case.dart';
import 'package:flutter/material.dart';

class UpdateLeadProvider extends ChangeNotifier {
  final UpdateLeadUseCase updateLeadUseCase;

  UpdateLeadProvider(this.updateLeadUseCase);

  bool isLoading = false;

  String? error;

  Future<void> updateLead({
    required String visitorSessionId,
    required String source,
    required double budget,
  }) async {
    try {
      error = null;
      isLoading = true;

      notifyListeners();

      await updateLeadUseCase.execute(
        visitorSessionId: visitorSessionId,
        source: source,
        budget: budget,
      );
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;

    notifyListeners();
  }
}

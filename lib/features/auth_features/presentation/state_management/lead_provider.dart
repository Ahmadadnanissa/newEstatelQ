import 'package:estatelqapp/core/services/lead_local_storage.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/create_lead_use_case.dart';
import 'package:flutter/material.dart';

class LeadProvider extends ChangeNotifier {
  final CreateLeadUseCase createLeadUseCase;

  LeadProvider(this.createLeadUseCase);

  bool isLoading = false;

  String? error;

  Future<void> createLead(String visitorSessionId) async {
    try {
      error = null;
      isLoading = true;
      notifyListeners();

      final lead = await createLeadUseCase.execute(visitorSessionId);

      await LeadLocalStorageService.saveLead(
        id: lead.id,
        createdAt: lead.createdAt,
        lastActiveAt: lead.lastActiveAt,
        isLead: lead.isLead,
        ip: lead.ip,
      );
      notifyListeners();
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;

    notifyListeners();
  }
}

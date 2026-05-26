import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/core/widgets/custom_message.dart';
import 'package:estatelqapp/features/profile_feature/domain/usecases/submit_complaint_use_case.dart';
import 'package:flutter/material.dart';

class SupportProvider extends ChangeNotifier {
  final SubmitComplaintUseCase submitComplaintUseCase;

  SupportProvider(this.submitComplaintUseCase);

  bool isLoading = false;
  String? error;

  Future<void> submitComplaint({
    required String message,
    required BuildContext context,
  }) async {
    try {
      isLoading = true;

      error = null;

      notifyListeners();

      final id = LocalStorageService.getId().toString();

      await submitComplaintUseCase.execute(id: id, message: message);

      CustomMessage.success(context, "Complaint sent successfully");
    } catch (e) {
      error = e.toString();

      CustomMessage.error(context, error!);
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }
}

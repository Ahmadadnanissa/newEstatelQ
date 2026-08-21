import 'package:estatelqapp/core/widgets/custom_message.dart';
import 'package:estatelqapp/features/profile_feature/data/models/complaint_type.dart';
import 'package:estatelqapp/features/profile_feature/domain/usecases/get_complaint_types_use_case.dart';
import 'package:estatelqapp/features/profile_feature/domain/usecases/submit_complaint_use_case.dart';
import 'package:flutter/material.dart';

class SupportProvider extends ChangeNotifier {
  final SubmitComplaintUseCase submitComplaintUseCase;
  final GetComplaintTypesUseCase getComplaintTypesUseCase;

  SupportProvider(this.submitComplaintUseCase, this.getComplaintTypesUseCase);

  // =========================
  // Complaint Types
  // =========================

  List<ComplaintType> complaintTypes = [];

  ComplaintType? selectedComplaintType;

  bool isLoadingTypes = false;

  String? typesError;

  // =========================
  // Submit Complaint
  // =========================

  bool isLoading = false;

  String? error;

  // =========================
  // Get Complaint Types
  // =========================

  Future<void> getComplaintTypes() async {
    try {
      isLoadingTypes = true;
      typesError = null;

      notifyListeners();

      complaintTypes = await getComplaintTypesUseCase.execute();
    } catch (e) {
      typesError = e.toString();
    } finally {
      isLoadingTypes = false;

      notifyListeners();
    }
  }

  // =========================
  // Select Complaint Type
  // =========================

  void selectComplaintType(ComplaintType? type) {
    selectedComplaintType = type;

    notifyListeners();
  }

  // =========================
  // Submit Complaint
  // =========================

  Future<bool> submitComplaint({
    required String message,
    required BuildContext context,
  }) async {
    if (selectedComplaintType == null) {
      CustomMessage.error(context, "Please select your complaint type");

      return false;
    }

    try {
      isLoading = true;
      error = null;

      notifyListeners();

      await submitComplaintUseCase.execute(
        issueMessage: message,
        complaintTypeId: selectedComplaintType!.id,
      );

      CustomMessage.success(context, "Complaint sent successfully");

      return true;
    } catch (e) {
      error = e.toString();

      CustomMessage.error(context, error!);

      return false;
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }
}

import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/core/widgets/custom_message.dart';
import 'package:estatelqapp/features/menu_feature/data/models/request_model.dart';
import 'package:estatelqapp/features/menu_feature/domain/usecases/send_request_use_case.dart';

import 'package:flutter/material.dart';

class RequestProvider extends ChangeNotifier {
  final SendRequestUseCase sendRequestUseCase;

  RequestProvider(this.sendRequestUseCase);

  bool isLoading = false;

  String? error;

  Future<void> sendRequest({
    required RequestModel request,
    required BuildContext context,
  }) async {
    final userType = LocalStorageService.getUserType();

    if (userType == null || userType == "guest") {
      CustomMessage.error(context, "Please create account first");

      return;
    }

    try {
      isLoading = true;

      notifyListeners();

      final token = LocalStorageService.getToken() ?? "";

      await sendRequestUseCase.execute(request: request, token: token);

      CustomMessage.success(context, "Request sent successfully");
    } catch (e) {
      error = e.toString();

      CustomMessage.error(context, error!);
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/core/widgets/custom_message.dart';
import '../../data/models/request_model.dart';
import '../../domain/usecases/send_request_use_case.dart';

class RequestProvider extends ChangeNotifier {
  final SendRequestUseCase sendRequestUseCase;

  RequestProvider(this.sendRequestUseCase);

  bool isLoading = false;

  Future<void> sendRequest({
    required RequestModel request,
    required String type,
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      final token = LocalStorageService.getToken(); // ممكن يكون null

      final message = await sendRequestUseCase.execute(
        request: request,
        type: type,
        token: token,
      );

      CustomMessage.success(context, message);
    } catch (e) {
      CustomMessage.error(context, e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

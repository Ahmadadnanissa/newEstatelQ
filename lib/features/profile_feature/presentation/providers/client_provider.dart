import 'package:estatelqapp/features/profile_feature/data/models/client_model..dart';
import 'package:estatelqapp/features/profile_feature/domain/usecases/get_client_use_case.dart';
import 'package:flutter/material.dart';

class ClientProvider extends ChangeNotifier {
  final GetClientUseCase getClientUseCase;

  ClientProvider(this.getClientUseCase);

  ClientModel? client;

  bool isLoading = false;
  String? error;

  Future<void> getClient(String id, String userType) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      client = await getClientUseCase.execute(id, userType);
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}

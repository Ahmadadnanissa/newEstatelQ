import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/core/widgets/custom_message.dart';
import 'package:estatelqapp/features/profile_feature/data/models/client_model..dart';
import 'package:estatelqapp/features/profile_feature/domain/usecases/get_client_use_case.dart';
import 'package:estatelqapp/features/profile_feature/domain/usecases/update_address_use_case.dart';
import 'package:estatelqapp/features/profile_feature/domain/usecases/update_profile_use_case.dart';
import 'package:flutter/material.dart';

class ClientProvider extends ChangeNotifier {
  final GetClientUseCase getClientUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ClientProvider(this.getClientUseCase, this.updateProfileUseCase);

  ClientModel? client;

  bool isLoading = false;
  String? error;

  Future<void> getClient(BuildContext context) async {
    final token = LocalStorageService.getToken();

    if (token == null) {
      CustomMessage.error(context, "Please create an account first");
      client = null;
      notifyListeners();
      return;
    }

    try {
      isLoading = true;
      error = null;
      notifyListeners();

      client = await getClientUseCase.execute(token);
    } catch (e) {
      error = e.toString();
      CustomMessage.error(context, error!);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> updateProfile({
    required String name,
    required String phone,
    required String image,
    required String location,
  }) async {
    final token = LocalStorageService.getToken();

    if (token == null) {
      error = "Please create an account first";
      notifyListeners();
      return false;
    }

    try {
      isLoading = true;
      error = null;
      notifyListeners();

      await updateProfileUseCase.execute(
        token: token,
        name: name,
        phone: phone,
        image: image,
        location: location,
      );
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
      return false;
    }
  }
}

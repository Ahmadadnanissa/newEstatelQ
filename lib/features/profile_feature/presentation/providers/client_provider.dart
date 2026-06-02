import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/core/widgets/custom_message.dart';
import 'package:estatelqapp/features/profile_feature/data/models/client_model..dart';
import 'package:estatelqapp/features/profile_feature/domain/usecases/get_client_use_case.dart';
import 'package:estatelqapp/features/profile_feature/domain/usecases/update_address_use_case.dart';
import 'package:estatelqapp/features/profile_feature/domain/usecases/update_profile_use_case.dart';
import 'package:flutter/material.dart';

class ClientProvider extends ChangeNotifier {
  final GetClientUseCase getClientUseCase;
  final UpdateAddressUseCase updateAddressUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ClientProvider(
    this.getClientUseCase,
    this.updateAddressUseCase,
    this.updateProfileUseCase,
  );

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

  Future<void> updateAddress({
    required double latitude,
    required double longitude,
    required BuildContext context,
  }) async {
    final token = LocalStorageService.getToken();

    if (token == null) {
      CustomMessage.error(context, "Please create an account first");
      return;
    }

    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final id = LocalStorageService.getId().toString();

      await updateAddressUseCase.execute(
        id: id,
        token: token,
        latitude: latitude,
        longitude: longitude,
      );

      CustomMessage.success(context, "Address updated successfully");
    } catch (e) {
      error = e.toString();
      CustomMessage.error(context, error!);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String image,
    required String location,
    required BuildContext context,
  }) async {
    final token = LocalStorageService.getToken();

    if (token == null) {
      CustomMessage.error(context, "Please create an account first");
      return;
    }

    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final id = LocalStorageService.getId().toString();

      await updateProfileUseCase.execute(
        id: id,
        token: token,
        name: name,
        email: email,
        phone: phone,
        image: image,
        location: location,
      );

      CustomMessage.success(context, "Profile updated successfully");
    } catch (e) {
      error = e.toString();
      CustomMessage.error(context, error!);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

import 'package:estatelqapp/features/auth_features/domain/usecases/google_login_with_use_case.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final GoogleLoginUseCase useCase;

  AuthProvider(this.useCase);

  bool isLoading = false;

  bool isSuccess = false;

  String? error;

  Future<void> loginWithGoogle(String idToken) async {
    try {
      isLoading = true;

      notifyListeners();

      isSuccess = await useCase.execute(idToken);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }
}

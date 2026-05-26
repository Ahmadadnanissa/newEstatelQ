import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/features/auth_features/data/models/login_response_model.dart';
import 'package:estatelqapp/features/auth_features/data/models/sign_up_response_model.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/google_login_with_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/login_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/send_otp_use_Case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/sign_up_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/verify_otp_use_case.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  // final LoginWithGoogleUseCase useCase;
  final SignupUseCase signupUseCase;
  final LoginUseCase loginUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final SendOtpUseCase sendOtpUseCase;
  AuthProvider(
    // this.useCase,
    this.loginUseCase,
    this.signupUseCase,
    this.verifyOtpUseCase,
    this.sendOtpUseCase,
  );

  bool isLoading = false;

  bool isSuccess = false;

  String? error;

  LoginResponseModel? userData;
  SignupResponseModel? signupData;
  LoginResponseModel? otpData;

  Future<void> login(String email, String password) async {
    error = null;
    try {
      isLoading = true;

      notifyListeners();

      userData = await loginUseCase.execute(email, password);
      await LocalStorageService.saveToken(userData!.token);

      await LocalStorageService.saveUser(
        id: userData!.user.id,

        name: userData!.user.name,

        email: userData!.user.email,
      );
      await LocalStorageService.saveUserType("client");
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  Future<void> signup(
    String name,
    String email,
    String password,
    String passwordConfirm,
  ) async {
    error = null;

    try {
      isLoading = true;

      notifyListeners();

      signupData = await signupUseCase.execute(
        name,
        email,
        password,
        passwordConfirm,
      );
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    error = null;

    try {
      isLoading = true;

      notifyListeners();

      otpData = await verifyOtpUseCase.execute(email, otp);

      await LocalStorageService.saveToken(otpData!.token);

      await LocalStorageService.saveUser(
        id: otpData!.user.id,

        name: otpData!.user.name,

        email: otpData!.user.email,
      );
      await LocalStorageService.saveUserType("client");
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  Future<void> resendOtp(String email) async {
    error = null;

    try {
      isLoading = true;
      notifyListeners();

      await sendOtpUseCase.execute(email);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Future<void> loginWithGoogle(String idToken) async {
  //   error = null;
  //   try {
  //     isLoading = true;

  //     notifyListeners();

  //     isSuccess = await useCase.execute(idToken);
  //   } catch (e) {
  //     error = e.toString();
  //   } finally {
  //     isLoading = false;

  //     notifyListeners();
  //   }
  // }
}

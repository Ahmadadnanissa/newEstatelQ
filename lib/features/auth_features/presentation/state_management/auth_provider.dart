import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/core/widgets/custom_message.dart';
import 'package:estatelqapp/features/auth_features/data/models/login_response_model.dart';
import 'package:estatelqapp/features/auth_features/data/models/sign_up_response_model.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/forgot_password_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/log_out_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/login_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/reset_password_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/send_otp_use_Case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/sign_up_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/verify_forgot_password_otp_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/verify_otp_use_case.dart';
import 'package:estatelqapp/features/forget_password_features/data/models/forget_passowrd_response_model.dart';
import 'package:estatelqapp/features/forget_password_features/data/models/reset_password_response_model.dart';
import 'package:estatelqapp/features/forget_password_features/data/models/verify_for_go_to_passowrd_otp_veriffy_response.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final SignupUseCase signupUseCase;
  final LoginUseCase loginUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final SendOtpUseCase sendOtpUseCase;
  final LogoutUseCase logoutUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final VerifyForgotPasswordOtpUseCase verifyForgotPasswordOtpUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  AuthProvider(
    this.loginUseCase,
    this.signupUseCase,
    this.verifyOtpUseCase,
    this.sendOtpUseCase,
    this.logoutUseCase,
    this.forgotPasswordUseCase,
    this.verifyForgotPasswordOtpUseCase,
    this.resetPasswordUseCase,
  );

  bool isLoading = false;

  bool isSuccess = false;

  String? error;

  LoginResponseModel? userData;

  SignupResponseModel? signupData;

  LoginResponseModel? otpData;

  ForgotPasswordResponseModel? forgotPasswordData;

  VerifyForgotPasswordOtpModel? verifyForgotPasswordOtpData;
  ResetPasswordResponseModel? resetPasswordData;

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

      await LocalStorageService.saveUserType(userData!.user.role);
    } catch (e) {
      error = e.toString().replaceFirst("Exception: ", "");
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
      error = e.toString().replaceFirst("Exception: ", "");
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

      await LocalStorageService.saveUserType(otpData!.user.role);
    } catch (e) {
      error = e.toString().replaceFirst("Exception: ", "");
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  Future<void> resendOtp(BuildContext context, String email) async {
    error = null;

    try {
      isLoading = true;

      notifyListeners();

      final message = await sendOtpUseCase.execute(email);

      CustomMessage.success(context, message);
    } catch (e) {
      error = e.toString().replaceFirst("Exception: ", "");

      CustomMessage.error(context, error!);
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  Future<void> logout(BuildContext context) async {
    final userType = LocalStorageService.getUserType();

    if (userType == null || userType == "guest") {
      CustomMessage.error(context, "Please create an account first");

      return;
    }

    try {
      isLoading = true;

      notifyListeners();

      final token = LocalStorageService.getToken();

      if (token == null) {
        CustomMessage.error(context, "User data not found");
        return;
      }

      final message = await logoutUseCase.execute(token);

      await LocalStorageService.logout();

      CustomMessage.success(context, message);
    } catch (e) {
      error = e.toString().replaceFirst("Exception: ", "");

      CustomMessage.error(context, error!);
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  Future<void> forgotPassword(BuildContext context, String email) async {
    error = null;

    try {
      isLoading = true;

      notifyListeners();

      forgotPasswordData = await forgotPasswordUseCase.execute(email);

      CustomMessage.success(
        context,
        forgotPasswordData?.message ?? "OTP sent successfully",
      );
    } catch (e) {
      error = e.toString().replaceFirst("Exception: ", "");

      CustomMessage.error(context, error!);
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  Future<void> verifyForgotPasswordOtp(String email, String otp) async {
    error = null;

    try {
      isLoading = true;

      notifyListeners();

      verifyForgotPasswordOtpData = await verifyForgotPasswordOtpUseCase
          .execute(email, otp);

      await LocalStorageService.saveResetToken(
        verifyForgotPasswordOtpData!.token,
      );
    } catch (e) {
      error = e.toString().replaceFirst("Exception: ", "");
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  Future<void> resetPassword(String password, String passwordConfirm) async {
    error = null;

    try {
      isLoading = true;

      notifyListeners();

      final token = LocalStorageService.getResetToken();

      if (token == null) {
        throw Exception("Reset token not found");
      }

      resetPasswordData = await resetPasswordUseCase.execute(
        password,
        passwordConfirm,
        token,
      );

      await LocalStorageService.saveToken(resetPasswordData!.token);

      await LocalStorageService.saveUser(
        id: resetPasswordData!.user.id,
        name: resetPasswordData!.user.name,
        email: resetPasswordData!.user.email,
      );

      await LocalStorageService.saveUserType(resetPasswordData!.user.role);
      await LocalStorageService.removeResetToken();
    } catch (e) {
      error = e.toString().replaceFirst("Exception: ", "");
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }
}

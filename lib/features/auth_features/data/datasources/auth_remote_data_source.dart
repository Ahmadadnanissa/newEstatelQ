import 'dart:convert';

import 'package:estatelqapp/core/services/constants.dart';
import 'package:estatelqapp/features/auth_features/data/models/login_response_model.dart';
import 'package:estatelqapp/features/auth_features/data/models/sign_up_response_model.dart';
import 'package:estatelqapp/features/forget_password_features/data/models/forget_passowrd_response_model.dart';
import 'package:estatelqapp/features/forget_password_features/data/models/reset_password_response_model.dart';
import 'package:estatelqapp/features/forget_password_features/data/models/verify_for_go_to_passowrd_otp_veriffy_response.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSource(this.client);

  Future<LoginResponseModel> login(String email, String password) async {
    final response = await client.post(
      Uri.parse("$baseUrl/api/v1/auth/login"),

      headers: {'Content-Type': 'application/json'},

      body: jsonEncode({"email": email, "password": password}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(data);
    }

    throw Exception(data["message"] ?? "Login failed");
  }

  Future<SignupResponseModel> signup(
    String name,
    String email,
    String password,
    String passwordConfirm,
  ) async {
    try {
      final url = Uri.parse("$baseUrl/api/v1/auth/signup");

      print("URL = $url");

      final response = await client.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "passwordConfirm": passwordConfirm,
        }),
      );

      print("STATUS = ${response.statusCode}");
      print("BODY = ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return SignupResponseModel.fromJson(data);
      }

      throw Exception(data["message"] ?? "Signup failed");
    } catch (e) {
      print("SIGNUP ERROR = $e");
      rethrow;
    }
  }

  // Future<SignupResponseModel> signup(
  //   String name,
  //   String email,
  //   String password,
  //   String passwordConfirm,
  // ) async {
  //   final response = await client.post(
  //     Uri.parse("$baseUrl/api/v1/auth/signup"),

  //     headers: {'Content-Type': 'application/json'},

  //     body: jsonEncode({
  //       "name": name,
  //       "email": email,
  //       "password": password,
  //       "passwordConfirm": passwordConfirm,
  //     }),
  //   );

  //   final data = jsonDecode(response.body);

  //   if (response.statusCode == 201) {
  //     return SignupResponseModel.fromJson(data);
  //   }

  //   throw Exception(data["message"] ?? "Signup failed");
  // }

  Future<LoginResponseModel> verifyOtp(String email, String otp) async {
    final response = await client.post(
      Uri.parse("$baseUrl/api/v1/auth/verifyOtp"),

      headers: {'Content-Type': 'application/json'},

      body: jsonEncode({"email": email, "otp": otp}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(data);
    }

    throw Exception(data["message"] ?? "OTP verification failed");
  }

  Future<String> sendOtp(String email) async {
    final response = await client.post(
      Uri.parse("$baseUrl/api/v1/auth/sendOtp"),

      headers: {'Content-Type': 'application/json'},

      body: jsonEncode({"email": email}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data["message"] ?? "OTP sent successfully";
    }

    throw Exception(data["message"] ?? "Failed to resend OTP");
  }

  Future<String> logout(String token) async {
    final response = await client.post(
      Uri.parse("$baseUrl/api/v1/auth/logout"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data["message"] ?? "Logged out successfully";
    }

    throw Exception(data["message"] ?? "Logout failed");
  }

  Future<ForgotPasswordResponseModel> forgotPassword(String email) async {
    final response = await client.post(
      Uri.parse("$baseUrl/api/v1/auth/forgotPassword"),

      headers: {'Content-Type': 'application/json'},

      body: jsonEncode({"email": email}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ForgotPasswordResponseModel.fromJson(data);
    }

    throw Exception(data["message"] ?? "Failed to send OTP");
  }

  Future<VerifyForgotPasswordOtpModel> verifyForgotPasswordOtp(
    String email,
    String otp,
  ) async {
    final response = await client.post(
      Uri.parse("$baseUrl/api/v1/auth/verifyPasswordResetOtp"),

      headers: {'Content-Type': 'application/json'},

      body: jsonEncode({"email": email, "otp": otp}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return VerifyForgotPasswordOtpModel.fromJson(data);
    }

    throw Exception(data["message"] ?? "OTP verification failed");
  }

  Future<ResetPasswordResponseModel> resetPassword(
    String password,
    String passwordConfirm,
    String resetToken,
  ) async {
    final response = await client.post(
      Uri.parse("$baseUrl/api/v1/auth/resetPassword/$resetToken"),

      headers: {'Content-Type': 'application/json'},

      body: jsonEncode({
        "password": password,
        "passwordConfirm": passwordConfirm,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ResetPasswordResponseModel.fromJson(data);
    }

    throw Exception(data["message"] ?? "Reset password failed");
  }
}

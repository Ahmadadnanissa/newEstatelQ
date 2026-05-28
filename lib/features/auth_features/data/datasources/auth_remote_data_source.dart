import 'dart:convert';

import 'package:estatelqapp/features/auth_features/data/models/login_response_model.dart';
import 'package:estatelqapp/features/auth_features/data/models/sign_up_response_model.dart';
import 'package:estatelqapp/features/forget_password_features/data/models/forget_passowrd_response_model.dart';
import 'package:estatelqapp/features/forget_password_features/data/models/verify_for_go_to_passowrd_otp_veriffy_response.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSource(this.client);

  // Future<bool> sendGoogleToken(String idToken) async {
  //   final response = await client.post(
  //     Uri.parse('YOUR_API'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({"id_token": idToken}),
  //   );

  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     throw Exception('Failed To Login');
  //   }
  // }

  Future<LoginResponseModel> login(String email, String password) async {
    final response = await client.post(
      Uri.parse("YOUR_URL/auth/login"),

      headers: {'Content-Type': 'application/json'},

      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return LoginResponseModel.fromJson(data);
    }

    throw Exception("Login failed");
  }

  Future<SignupResponseModel> signup(
    String name,
    String email,
    String password,
    String passwordConfirm,
  ) async {
    final response = await client.post(
      Uri.parse("YOUR_URL/auth/signup"),

      headers: {'Content-Type': 'application/json'},

      body: jsonEncode({
        "name": name,

        "email": email,

        "password": password,

        "passwordConfirm": passwordConfirm,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);

      return SignupResponseModel.fromJson(data);
    }

    throw Exception("Signup failed");
  }

  Future<LoginResponseModel> verifyOtp(String email, String otp) async {
    final response = await client.post(
      Uri.parse("YOUR_URL/auth/verifyOtp"),

      headers: {'Content-Type': 'application/json'},

      body: jsonEncode({"email": email, "otp": otp}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return LoginResponseModel.fromJson(data);
    }

    throw Exception("OTP verification failed");
  }

  Future<void> sendOtp(String email) async {
    final response = await client.post(
      Uri.parse("YOUR_URL/auth/sendOtp"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email}),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to resend OTP");
    }
  }

  Future<void> logout(String id) async {
    final response = await client.post(
      Uri.parse("YOUR_URL/logout"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"id": id}),
    );

    if (response.statusCode != 200) {
      throw Exception("Logout failed");
    }
  }

  Future<ForgotPasswordResponseModel> forgotPassword(String email) async {
    final response = await client.post(
      Uri.parse("YOUR_URL/auth/forgotPassword"),

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
      Uri.parse("YOUR_URL/auth/verifyForgotPasswordOtp"),

      headers: {'Content-Type': 'application/json'},

      body: jsonEncode({"email": email, "otp": otp}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return VerifyForgotPasswordOtpModel.fromJson(data);
    }

    throw Exception(data["message"] ?? "OTP verification failed");
  }

  Future<void> resetPassword(
    String password,
    String passwordConfirm,
    String resetToken,
  ) async {
    final response = await client.patch(
      Uri.parse("YOUR_URL/auth/resetPassword"),

      headers: {
        'Content-Type': 'application/json',

        "Authorization": "Bearer $resetToken",
      },

      body: jsonEncode({
        "password": password,
        "passwordConfirm": passwordConfirm,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw Exception(data["message"] ?? "Reset password failed");
    }
  }
}

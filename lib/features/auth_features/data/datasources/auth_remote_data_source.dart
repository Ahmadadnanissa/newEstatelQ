import 'dart:convert';

import 'package:estatelqapp/features/auth_features/data/models/login_response_model.dart';
import 'package:estatelqapp/features/auth_features/data/models/sign_up_response_model.dart';
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
}

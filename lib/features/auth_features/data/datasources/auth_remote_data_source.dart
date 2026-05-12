import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSource(this.client);

  Future<bool> sendGoogleToken(String idToken) async {
    final response = await client.post(
      Uri.parse('YOUR_API'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"id_token": idToken}),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed To Login');
    }
  }
}

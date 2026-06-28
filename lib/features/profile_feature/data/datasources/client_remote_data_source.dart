import 'dart:convert';
import 'package:estatelqapp/core/services/constants.dart';
import 'package:estatelqapp/features/profile_feature/data/models/client_model..dart';
import 'package:http/http.dart' as http;

class ClientRemoteDataSource {
  final http.Client client;

  ClientRemoteDataSource(this.client);

  Future<ClientModel> getClient(String token) async {
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/auth/getMe"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      return ClientModel.fromJson(json["data"]);
    } else {
      throw Exception("Failed to get client");
    }
  }

  Future<void> updateProfile({
    required String token,
    String? name,
    String? phone,
    String? image,
    String? location,
  }) async {
    final body = <String, dynamic>{};

    if (name != null) body["name"] = name;
    if (phone != null) body["phone"] = phone;
    if (image != null) body["photo"] = image;
    if (location != null) body["location"] = location;

    final response = await client.patch(
      Uri.parse("$baseUrl/api/v1/clients/updateMe"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to update profile");
    }
  }
}

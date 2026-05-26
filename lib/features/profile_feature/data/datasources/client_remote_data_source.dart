import 'dart:convert';
import 'package:estatelqapp/features/profile_feature/data/models/client_model..dart';
import 'package:http/http.dart' as http;

class ClientRemoteDataSource {
  final http.Client client;

  ClientRemoteDataSource(this.client);

  Future<ClientModel> getClient(String id) async {
    final response = await client.get(
      Uri.parse("YOUR_URL/client?id=$id"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ClientModel.fromJson(data);
    } else {
      throw Exception("Failed to get client");
    }
  }

  Future<void> updateAddress({
    required String id,
    required String token,
    required double latitude,
    required double longitude,
  }) async {
    final response = await client.put(
      Uri.parse("YOUR_URL/client/address"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "id": id,
        "latitude": latitude,
        "longitude": longitude,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to update address");
    }
  }

  Future<void> updateProfile({
    required String id,
    required String token,
    required String name,
    required String email,
    required String phone,
    required String image,
    required String location,
  }) async {
    final response = await client.put(
      Uri.parse("YOUR_URL/client/update-profile"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "image": image,
        "location": location,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to update profile");
    }
  }
}

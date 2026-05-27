import 'dart:convert';

import 'package:estatelqapp/features/menu_feature/data/models/request_model.dart';
import 'package:http/http.dart' as http;

class RequestRemoteDataSource {
  final http.Client client;

  RequestRemoteDataSource(this.client);

  Future<void> sendRequest({
    required RequestModel request,
    required String token,
  }) async {
    final response = await client.post(
      Uri.parse("YOUR_URL/property-request"),

      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },

      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      final data = jsonDecode(response.body);

      throw Exception(data["message"] ?? "Failed to send request");
    }
  }
}

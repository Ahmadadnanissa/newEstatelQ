import 'dart:convert';
import 'package:estatelqapp/features/profile_feature/data/models/client_model..dart';
import 'package:http/http.dart' as http;

class ClientRemoteDataSource {
  final http.Client client;

  ClientRemoteDataSource(this.client);

  Future<ClientModel> getClient(String id, String userType) async {
    final response = await client.get(
      Uri.parse("YOUR_URL/client?id=$id&userType=$userType"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return ClientModel.fromJson(data);
    } else {
      throw Exception("Failed to get client");
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class SupportRemoteDataSource {
  final http.Client client;

  SupportRemoteDataSource(this.client);

  Future<void> submitComplaint({
    required String id,
    required String message,
  }) async {
    final response = await client.post(
      Uri.parse("YOUR_URL/support/send-complaint"),

      headers: {"Content-Type": "application/json"},

      body: jsonEncode({"id": id, "message": message}),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to send complaint");
    }
  }
}

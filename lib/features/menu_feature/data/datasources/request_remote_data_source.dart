import 'dart:convert';
import 'package:estatelqapp/core/services/constants.dart';
import 'package:http/http.dart' as http;
import '../models/request_model.dart';

class RequestRemoteDataSource {
  final http.Client client;

  RequestRemoteDataSource(this.client);

  Future<String> sendRequest({
    required RequestModel request,
    required String type, // 🔥 NEW (SELL / RENT)
    required String? token,
  }) async {
    final response = await client.post(
      Uri.parse("$baseUrl/api/v1/requests"),
      headers: {
        "Content-Type": "application/json",
        if (token != null && token.isNotEmpty) "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "type": type,
        "message": "يرجى التواصل لترتيب موعد معاينة العقار في أقرب وقت.",

        "sellData": request.toJson(),
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return data["message"] ?? "Request sent successfully";
    }

    throw Exception(data["message"] ?? "Request failed");
  }
}

import 'dart:convert';

import 'package:estatelqapp/core/services/constants.dart';
import 'package:estatelqapp/features/auth_features/data/models/lead_model.dart';
import 'package:http/http.dart' as http;

class LeadRemoteDataSource {
  Future<LeadModel> createLead(String visitorSessionId) async {
    final response = await http.post(
      Uri.parse("$baseUrl/api/v1/leads"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"visitorSessionId": visitorSessionId}),
    );

    print(response.statusCode);
    print(response.body);

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return LeadModel.fromJson(data["data"]);
    }

    throw Exception(data["message"] ?? "Failed to create lead");
  }
}

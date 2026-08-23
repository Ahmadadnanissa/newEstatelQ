import 'dart:convert';

import 'package:estatelqapp/core/services/constants.dart';
import 'package:estatelqapp/features/auth_features/data/models/update_lead_model.dart';
import 'package:http/http.dart' as http;

class UpdateLeadRemoteDataSource {
  Future<UpdateLeadModel> updateLead({
    required String visitorSessionId,
    required String source,
    required double budget,
  }) async {
    final response = await http.patch(
      Uri.parse("$baseUrl/api/v1/leads"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "visitorSessionId": visitorSessionId,
        "source": source,
        "budget": budget,
      }),
    );

    print(response.statusCode);
    print(response.body);

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return UpdateLeadModel.fromJson(data);
    }

    throw Exception(data["message"] ?? "Failed to update lead");
  }
}

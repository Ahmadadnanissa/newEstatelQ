import 'dart:convert';

import 'package:estatelqapp/core/services/constants.dart';
import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/features/profile_feature/data/models/complaint_type.dart';
import 'package:http/http.dart' as http;

class SupportRemoteDataSource {
  final http.Client client;

  SupportRemoteDataSource(this.client);

  Future<List<ComplaintType>> getComplaintTypes() async {
    final token = LocalStorageService.getToken();

    if (token == null || token.isEmpty) {
      throw Exception("Authentication token not found");
    }

    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/complaints/complaintTypes"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode != 200) {
      String message = "Failed to load complaint types";

      try {
        final data = jsonDecode(response.body);

        if (data is Map && data["message"] != null) {
          message = data["message"].toString();
        }
      } catch (_) {}

      throw Exception(message);
    }

    final data = jsonDecode(response.body);

    if (data["status"] != "success") {
      throw Exception(
        data["message"]?.toString() ?? "Failed to load complaint types",
      );
    }

    final List<dynamic> results = data["data"] ?? [];

    return results
        .map((item) => ComplaintType.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<void> submitComplaint({
    required String issueMessage,
    required String complaintTypeId,
  }) async {
    final token = LocalStorageService.getToken();

    if (token == null || token.isEmpty) {
      throw Exception("Authentication token not found");
    }

    final response = await client.post(
      Uri.parse("$baseUrl/api/v1/complaints"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "issueMessage": issueMessage,
        "complaintTypeId": complaintTypeId,
      }),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      String message = "Failed to send complaint";

      try {
        final data = jsonDecode(response.body);

        if (data is Map && data["message"] != null) {
          message = data["message"].toString();
        }
      } catch (_) {}

      throw Exception(message);
    }

    try {
      final data = jsonDecode(response.body);

      if (data["status"] != "success") {
        throw Exception(
          data["message"]?.toString() ?? "Failed to send complaint",
        );
      }
    } catch (e) {
      if (e is Exception) {
        rethrow;
      }
    }
  }
}

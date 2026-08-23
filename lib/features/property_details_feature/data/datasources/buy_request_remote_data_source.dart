import 'dart:convert';

import 'package:estatelqapp/core/services/constants.dart';
import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/buy_request_model.dart';
import 'package:http/http.dart' as http;

class BuyRequestRemoteDataSource {
  Future<BuyRequestModel> createBuyRequest({
    required String type,
    String? message,
    required String propertyId,
  }) async {
    final token = LocalStorageService.getToken();

    final Map<String, dynamic> body = {"type": type, "propertyId": propertyId};

    if (message != null && message.trim().isNotEmpty) {
      body["message"] = message.trim();
    }

    final response = await http.post(
      Uri.parse("$baseUrl/api/v1/requests/buyRequest"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );

    print(response.statusCode);
    print(response.body);

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return BuyRequestModel.fromJson(data);
    }

    throw Exception(data["message"] ?? "Failed to create request");
  }
}

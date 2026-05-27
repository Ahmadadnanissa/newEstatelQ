import 'dart:convert';

import 'package:estatelqapp/features/menu_feature/data/models/property_activity_model.dart';
import 'package:http/http.dart' as http;

class PropertyStatusRemoteDataSource {
  final http.Client client;

  PropertyStatusRemoteDataSource(this.client);

  Future<List<PropertyActivityModel>> getActivities(
    String propertyId,
    String token,
  ) async {
    final response = await client.get(
      Uri.parse("YOUR_URL/property-status/$propertyId"),

      headers: {
        "Content-Type": "application/json",

        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return List.from(
        data,
      ).map((e) => PropertyActivityModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load activities");
    }
  }
}

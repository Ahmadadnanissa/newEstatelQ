import 'dart:convert';

import 'package:estatelqapp/core/services/constants.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/filter_property_model.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';
import 'package:http/http.dart' as http;

class PropertyCardRemoteDataSource {
  final http.Client client;

  PropertyCardRemoteDataSource(this.client);

  Future<List<PropertyCardModel>> getProperties({
    required int limit,
    String? cursor,
    FilterPropertyModel? filter,
  }) async {
    final Map<String, dynamic> query = {"limit": limit.toString()};

    if (cursor != null && cursor.isNotEmpty) {
      query["cursor"] = cursor;
    }

    if (filter != null) {
      query.addAll(filter.toJson());
    }

    final uri = Uri.parse("$baseUrl/api/v1/properties").replace(
      queryParameters: query.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    final response = await client.get(
      uri,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data["data"] as List)
          .map((e) => PropertyCardModel.fromJson(e))
          .toList();
    }
    final data = jsonDecode(response.body);
    throw Exception(data["message"] ?? "Error");
  }

  Future<List<PropertyCardModel>> searchProperties({
    required int limit,
    String? cursor,
    FilterPropertyModel? filter,
  }) async {
    final Map<String, dynamic> query = {"limit": limit.toString()};

    if (cursor != null && cursor.isNotEmpty) {
      query["cursor"] = cursor;
    }

    if (filter != null) {
      query.addAll(filter.toJson());
    }

    final uri = Uri.parse("$baseUrl/api/v1/properties/search").replace(
      queryParameters: query.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    final response = await client.get(
      uri,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data["data"] as List)
          .map((e) => PropertyCardModel.fromJson(e))
          .toList();
    }
    final data = jsonDecode(response.body);
    throw Exception(data["message"] ?? "Failed To Search Properties");
  }
}

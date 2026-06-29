import 'dart:convert';

import 'package:estatelqapp/core/services/constants.dart';
import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/filter_property_model.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';
import 'package:http/http.dart' as http;

class FavoriteRemoteDataSource {
  Future<List<PropertyCardModel>> getFavoriteProperties({
    int page = 1,
    int limit = 10,
    FilterPropertyModel? filter,
  }) async {
    final token = LocalStorageService.getToken();

    final queryParameters = {
      "page": page.toString(),
      "limit": limit.toString(),
      ...?filter?.toJson(),
    };

    final uri = Uri.parse(
      "$baseUrl/api/v1/clients/favorite",
    ).replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );
    print(response.statusCode);
    print(response.body);
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List favorites = data["data"];

      return favorites.map((e) => PropertyCardModel.fromJson(e)).toList();
    }

    throw Exception(data["message"] ?? "Failed to load favorites");
  }

  Future<void> addToFavorite(String propertyId) async {
    final token = LocalStorageService.getToken();
    print(token);
    final response = await http.post(
      Uri.parse("$baseUrl/api/v1/clients/favorite"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode({"propertyId": propertyId}),
    );

    print(response.statusCode);
    print(response.body);
    final data = jsonDecode(response.body);

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception(data["message"] ?? "Failed to add favorite");
    }
  }
}

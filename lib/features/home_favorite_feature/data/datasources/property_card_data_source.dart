// import 'dart:convert';

// import 'package:estatelqapp/features/home_favorite_feature/data/models/filter_property_model.dart';
// import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';
// import 'package:http/http.dart' as http;

// class PropertyCardRemoteDataSource {
//   final http.Client client;

//   PropertyCardRemoteDataSource(this.client);

//   Future<List<PropertyCardModel>> getProperties({
//     required int limit,
//     String? cursor,
//     FilterPropertyModel? filter,
//   }) async {
//     final Map<String, dynamic> query = {"limit": limit.toString()};

//     if (cursor != null && cursor.isNotEmpty) {
//       query["cursor"] = cursor;
//     }

//     if (filter != null) {
//       query.addAll(filter.toJson());
//     }

//     final uri = Uri.parse("YOUR_URL/api/v1/properties").replace(
//       queryParameters: query.map(
//         (key, value) => MapEntry(key, value.toString()),
//       ),
//     );

//     final response = await client.get(
//       uri,
//       headers: {"Content-Type": "application/json"},
//     );

//     final data = jsonDecode(response.body);

//     if (response.statusCode == 200) {
//       return (data["data"] as List)
//           .map((e) => PropertyCardModel.fromJson(e))
//           .toList();
//     }

//     throw Exception(data["message"] ?? "Failed To Load Properties");
//   }

//   Future<List<PropertyCardModel>> searchProperties({
//     required int limit,
//     String? cursor,
//     FilterPropertyModel? filter,
//   }) async {
//     final Map<String, dynamic> query = {"limit": limit.toString()};

//     if (cursor != null && cursor.isNotEmpty) {
//       query["cursor"] = cursor;
//     }

//     if (filter != null) {
//       query.addAll(filter.toJson());
//     }

//     final uri = Uri.parse("YOUR_URL/api/v1/properties/search").replace(
//       queryParameters: query.map(
//         (key, value) => MapEntry(key, value.toString()),
//       ),
//     );

//     final response = await client.get(
//       uri,
//       headers: {"Content-Type": "application/json"},
//     );

//     final data = jsonDecode(response.body);

//     if (response.statusCode == 200) {
//       return (data["data"] as List)
//           .map((e) => PropertyCardModel.fromJson(e))
//           .toList();
//     }

//     throw Exception(data["message"] ?? "Failed To Search Properties");
//   }
// }

import 'dart:convert';

import 'package:estatelqapp/features/home_favorite_feature/data/models/filter_property_model.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';
import 'package:http/http.dart' as client;

class PropertyCardRemoteDataSource {
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

    final uri = Uri.parse("YOUR_URL/api/v1/properties/search").replace(
      queryParameters: query.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    final response = await client.get(
      uri,
      headers: {"Content-Type": "application/json"},
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return (data["data"] as List)
          .map((e) => PropertyCardModel.fromJson(e))
          .toList();
    }

    throw Exception(data["message"] ?? "Failed To Search Properties");
  }

  Future<List<PropertyCardModel>> getProperties({
    required int limit,
    String? cursor,
    FilterPropertyModel? filter,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    List<PropertyCardModel> allProperties = [
      PropertyCardModel(
        id: "1",
        referenceCode: "A-1",
        type: "APARTMENT",
        listingType: "SALE",
        simpleDescription: "Modern apartment in downtown Damascus",
        city: "Damascus",
        listedPrice: 7000,
        sqft: 120,
        numOfRooms: 3,
        bathrooms: 2,
        primaryImage: "assets/images/apartment.jpg",
      ),

      PropertyCardModel(
        id: "2",
        referenceCode: "V-1",
        type: "VILLA",
        listingType: "SALE",
        simpleDescription: "Luxury villa with swimming pool",
        city: "Damascus",
        listedPrice: 15000,
        sqft: 450,
        numOfRooms: 6,
        bathrooms: 5,
        primaryImage: "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",
      ),

      PropertyCardModel(
        id: "3",
        referenceCode: "H-1",
        type: "HOUSE",
        listingType: "SALE",
        simpleDescription: "Family house in a quiet area",
        city: "Aleppo",
        listedPrice: 6000,
        sqft: 220,
        numOfRooms: 4,
        bathrooms: 2,
        primaryImage: "assets/images/apartment.jpg",
      ),

      PropertyCardModel(
        id: "4",
        referenceCode: "O-1",
        type: "OFFICE",
        listingType: "RENT",
        simpleDescription: "Office space in business center",
        city: "Homs",
        listedPrice: 1000,
        sqft: 80,
        numOfRooms: 2,
        bathrooms: 1,
        primaryImage: "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",
      ),

      PropertyCardModel(
        id: "5",
        referenceCode: "S-1",
        type: "STORE",
        listingType: "RENT",
        simpleDescription: "Commercial store in main street",
        city: "Latakia",
        listedPrice: 2500,
        sqft: 90,
        numOfRooms: 1,
        bathrooms: 1,
        primaryImage: "assets/images/apartment.jpg",
      ),

      PropertyCardModel(
        id: "6",
        referenceCode: "V-2",
        type: "VILLA",
        listingType: "SALE",
        simpleDescription: "Modern villa with garden",
        city: "Damascus",
        listedPrice: 12000,
        sqft: 380,
        numOfRooms: 5,
        bathrooms: 4,
        primaryImage: "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",
      ),

      PropertyCardModel(
        id: "7",
        referenceCode: "A-2",
        type: "APARTMENT",
        listingType: "RENT",
        simpleDescription: "Apartment near university",
        city: "Homs",
        listedPrice: 800,
        sqft: 110,
        numOfRooms: 2,
        bathrooms: 1,
        primaryImage: "assets/images/apartment.jpg",
      ),

      PropertyCardModel(
        id: "8",
        referenceCode: "H-2",
        type: "HOUSE",
        listingType: "SALE",
        simpleDescription: "Large house with parking",
        city: "Tartous",
        listedPrice: 9000,
        sqft: 260,
        numOfRooms: 5,
        bathrooms: 3,
        primaryImage: "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",
      ),
    ];

    /// FILTERS

    if (filter != null) {
      allProperties = allProperties.where((property) {
        bool matches = true;

        if (filter.city != null) {
          matches &= property.city.toLowerCase().contains(
            filter.city!.toLowerCase(),
          );
        }

        if (filter.type != null) {
          matches &= property.type == filter.type;
        }

        if (filter.listingType != null) {
          matches &= property.listingType == filter.listingType;
        }

        if (filter.numOfRooms != null) {
          matches &= property.numOfRooms >= filter.numOfRooms!;
        }

        if (filter.minPrice != null) {
          matches &= property.listedPrice >= filter.minPrice!;
        }

        if (filter.maxPrice != null) {
          matches &= property.listedPrice <= filter.maxPrice!;
        }

        return matches;
      }).toList();
    }

    /// CURSOR PAGINATION

    int startIndex = 0;

    if (cursor != null) {
      final index = allProperties.indexWhere((element) => element.id == cursor);

      if (index != -1) {
        startIndex = index + 1;
      }
    }

    final endIndex = (startIndex + limit > allProperties.length)
        ? allProperties.length
        : startIndex + limit;

    return allProperties.sublist(startIndex, endIndex);
  }
}

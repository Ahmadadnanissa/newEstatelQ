// import 'dart:convert';

// import 'package:estatelqapp/features/home_favorite_feature/data/models/filter_property_model.dart';
// import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';

// import 'package:http/http.dart' as http;

// class PropertyCardRemoteDataSource {
//   final http.Client client;

//   PropertyCardRemoteDataSource(this.client);

//   Future<List<PropertyCardModel>> getProperties({
//     required int page,
//     required int limit,
//     FilterPropertyModel? filter,
//   }) async {
//     Map<String, dynamic> query = {
//       "page": page.toString(),
//       "limit": limit.toString(),
//     };

//     if (filter != null) {
//       query.addAll(filter.toJson());
//     }

//     final uri = Uri.parse("YOUR_URL/properties").replace(
//       queryParameters: query.map(
//         (key, value) => MapEntry(key, value.toString()),
//       ),
//     );

//     final response = await client.get(
//       uri,

//       headers: {'Content-Type': 'application/json'},
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);

//       return (data["data"] as List)
//           .map((e) => PropertyCardModel.fromJson(e))
//           .toList();
//     }

//     throw Exception("Failed To Load Properties");
//   }
// }

import 'package:estatelqapp/features/home_favorite_feature/data/models/filter_property_model.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';

class PropertyCardRemoteDataSource {
  Future<List<PropertyCardModel>> getProperties({
    required int page,
    required int limit,
    FilterPropertyModel? filter,
  }) async {
    await Future.delayed(Duration(seconds: 1));

    List<PropertyCardModel> allProperties = [
      PropertyCardModel(
        id: "1",
        title: "Modern Apartment",
        images: ["assets/images/apartment.jpg"],
        location: "Homs",
        price: 1200,
        type: "Apartment",
        rooms: 3,
        bathrooms: 2,
        sqft: 120,
      ),

      PropertyCardModel(
        id: "2",
        title: "Luxury Villa",
        images: ["assets/images/jesse-collins-LUitWpwc008-unsplash.jpg"],
        location: "Damascus",
        price: 4500,
        type: "Villa",
        rooms: 5,
        bathrooms: 4,
        sqft: 350,
      ),

      PropertyCardModel(
        id: "3",
        title: "Family House",
        images: ["assets/images/apartment.jpg"],
        location: "Aleppo",
        price: 1800,
        type: "House",
        rooms: 4,
        bathrooms: 2,
        sqft: 210,
      ),

      PropertyCardModel(
        id: "4",
        title: "Office Center",
        images: ["assets/images/jesse-collins-LUitWpwc008-unsplash.jpg"],
        location: "Hama",
        price: 900,
        type: "office",
        rooms: 2,
        bathrooms: 1,
        sqft: 80,
      ),

      PropertyCardModel(
        id: "500",
        title: "Big Villa",
        images: ["assets/images/apartment.jpg"],
        location: "Homs",
        price: 6000,
        type: "Villa",
        rooms: 6,
        bathrooms: 5,
        sqft: 450,
      ),

      PropertyCardModel(
        id: "6",
        title: "Sea Apartment",
        images: ["assets/images/jesse-collins-LUitWpwc008-unsplash.jpg"],
        location: "Tartus",
        price: 2500,
        type: "Apartment",
        rooms: 3,
        bathrooms: 2,
        sqft: 150,
      ),

      PropertyCardModel(
        id: "5",
        title: "Clothes Store",
        images: ["assets/images/apartment.jpg"],
        location: "Homs",
        price: 3000,
        type: "Store",
        rooms: 1,
        bathrooms: 1,
        sqft: 90,
      ),

      PropertyCardModel(
        id: "8",
        title: "Coffee Shop",
        images: ["assets/images/jesse-collins-LUitWpwc008-unsplash.jpg"],
        location: "Latakia",
        price: 2100,
        type: "Store",
        rooms: 2,
        bathrooms: 1,
        sqft: 100,
      ),
    ];

    /// فلترة

    if (filter != null) {
      allProperties = allProperties.where((e) {
        bool matches = true;

        if (filter.location != null) {
          matches &= e.location.toLowerCase().contains(
            filter.location!.toLowerCase(),
          );
        }

        if (filter.type != null) {
          matches &= e.type == filter.type;
        }

        if (filter.rooms != null) {
          matches &= e.rooms >= filter.rooms!;
        }

        if (filter.minPrice != null) {
          matches &= e.price >= filter.minPrice!;
        }

        if (filter.maxPrice != null) {
          matches &= e.price <= filter.maxPrice!;
        }

        return matches;
      }).toList();
    }

    /// pagination

    int start = (page - 1) * limit;

    int end = start + limit;

    if (start >= allProperties.length) {
      return [];
    }

    if (end > allProperties.length) {
      end = allProperties.length;
    }

    return allProperties.sublist(start, end);
  }
}

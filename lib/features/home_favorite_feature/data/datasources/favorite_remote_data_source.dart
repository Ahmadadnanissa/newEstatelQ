// // import 'dart:convert';

// // import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';
// // import 'package:http/http.dart' as http;

// // class FavoriteRemoteDataSource {
// //   final http.Client client;

// //   FavoriteRemoteDataSource(this.client);

// //   // جلب كل المفضلات
// //   Future<List<PropertyCardModel>> getFavoriteProperties() async {
// //     final response = await client.get(
// //       Uri.parse("YOUR_URL/favorites"),

// //       headers: {
// //         "Content-Type": "application/json",

// //         // إذا عندك توكن
// //         // "Authorization":"Bearer $token"
// //       },
// //     );

// //     if (response.statusCode == 200) {
// //       final data = jsonDecode(response.body);

// //       return (data["data"] as List)
// //           .map((e) => PropertyCardModel.fromJson(e))
// //           .toList();
// //     }

// //     throw Exception("Failed to load favorites");
// //   }

// //   // إضافة عقار للمفضلة
// //   Future<void> addToFavorite(String propertyId) async {
// //     final response = await client.post(
// //       Uri.parse("YOUR_URL/favorites"),

// //       headers: {"Content-Type": "application/json"},

// //       body: jsonEncode({"propertyId": propertyId}),
// //     );

// //     if (response.statusCode != 200 && response.statusCode != 201) {
// //       throw Exception("Failed To Add Favorite");
// //     }
// //   }
// // }

// import 'dart:async';

// import 'package:estatelqapp/features/home_favorite_feature/data/datasources/property_card_data_source.dart';
// import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';

// class FavoriteRemoteDataSource {
//   static List<String> favoriteIds = [];

//   Future<List<PropertyCardModel>> getFavoriteProperties() async {
//     await Future.delayed(Duration(milliseconds: 500));

//     List<PropertyCardModel> allProperties = await PropertyCardRemoteDataSource()
//         .getProperties(cursor: 1, limit: 100, filter: null);

//     return allProperties.where((property) {
//       return favoriteIds.contains(property.id);
//     }).toList();
//   }

//   Future<void> addToFavorite(String propertyId) async {
//     await Future.delayed(Duration(milliseconds: 400));

//     if (!favoriteIds.contains(propertyId)) {
//       favoriteIds.add(propertyId);
//     }
//   }
// }

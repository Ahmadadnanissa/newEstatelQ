// import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';
// import 'package:estatelqapp/features/home_favorite_feature/domain/usecases/add_to_favorite_use_case.dart';
// import 'package:estatelqapp/features/home_favorite_feature/domain/usecases/get_fovorite_properties_use_case.dart';
// import 'package:flutter/material.dart';

// class FavoriteProvider extends ChangeNotifier {
//   final GetFavoritePropertiesUseCase getFavoriteUseCase;

//   final AddToFavoriteUseCase addFavoriteUseCase;

//   FavoriteProvider(this.getFavoriteUseCase, this.addFavoriteUseCase);

//   List<PropertyCardModel> favoriteProperties = [];

//   bool isLoading = false;

//   String? error;

//   Future<void> getFavorites() async {
//     try {
//       error = null;

//       isLoading = true;

//       notifyListeners();

//       final result = await getFavoriteUseCase.execute();

//       favoriteProperties = result;
//     } catch (e) {
//       error = e.toString();
//     }

//     isLoading = false;

//     notifyListeners();
//   }

//   Future<void> addToFavorite(String propertyId) async {
//     try {
//       error = null;

//       await addFavoriteUseCase.execute(propertyId);

//       final result = await getFavoriteUseCase.execute();

//       favoriteProperties = result;

//       notifyListeners();
//     } catch (e) {
//       error = e.toString();

//       notifyListeners();
//     }
//   }

//   bool isFavorite(String propertyId) {
//     return favoriteProperties.any((e) => e.id == propertyId);
//   }
// }

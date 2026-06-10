import 'package:estatelqapp/features/home_favorite_feature/data/models/filter_property_model.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';
import 'package:estatelqapp/features/home_favorite_feature/domain/usecases/get_property_cards_use_case.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final GetPropertiesCardUseCase useCase;

  HomeProvider(this.useCase);

  FilterPropertyModel filter = FilterPropertyModel();

  List<PropertyCardModel> properties = [];

  bool isLoading = false;

  String? error;

  bool hasMore = true;

  String? cursor;

  final int limit = 5;

  Future<void> getProperties() async {
    if (isLoading || !hasMore) {
      return;
    }

    try {
      error = null;

      isLoading = true;

      notifyListeners();

      final result = await useCase.execute(
        limit: limit,
        cursor: cursor,
        filter: filter,
      );

      if (result.isEmpty) {
        hasMore = false;
      } else {
        properties.addAll(result);

        cursor = result.last.id;

        if (result.length < limit) {
          hasMore = false;
        }
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  Future<void> refresh() async {
    cursor = null;

    hasMore = true;

    error = null;

    properties.clear();

    await getProperties();
  }

  Future<void> setType(String type) async {
    filter.type = type == "All" ? null : type;

    await refresh();
  }

  Future<void> setCity(String city) async {
    filter.city = city.isEmpty ? null : city;

    await refresh();
  }

  Future<void> setListingType(String listingType) async {
    filter.listingType = listingType == "All" ? null : listingType;

    await refresh();
  }

  Future<void> clearFilters() async {
    filter = FilterPropertyModel();

    await refresh();
  }
}

import 'package:flutter/material.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/filter_property_model.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/models/property_card_model.dart';
import 'package:estatelqapp/features/home_favorite_feature/domain/usecases/get_property_cards_use_case.dart';

class HomeProvider extends ChangeNotifier {
  final GetPropertiesCardUseCase useCase;

  HomeProvider(this.useCase);

  // =====================
  // STATE
  // =====================
  FilterPropertyModel filter = FilterPropertyModel();

  List<PropertyCardModel> properties = [];

  String searchText = "";

  bool isLoading = false;
  bool isRefreshing = false;

  String? error;

  bool hasMore = true;
  String? cursor;

  final int limit = 5;

  // =====================
  // SEARCH
  // =====================
  Future<void> setSearch(String value) async {
    searchText = value;
    filter.q = value.trim().isEmpty ? null : value.trim();

    await refresh();
  }

  Future<void> clearSearch() async {
    searchText = "";
    filter.q = null;

    await refresh();
  }

  // =====================
  // MAIN FETCH
  // =====================
  Future<void> getProperties() async {
    if (isLoading || !hasMore) return;

    try {
      isLoading = true;
      error = null;
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

  // =====================
  // REFRESH (IMPORTANT FIX)
  // =====================
  Future<void> refresh() async {
    if (isRefreshing) return;

    try {
      isRefreshing = true;

      cursor = null;
      hasMore = true;
      error = null;
      properties.clear();

      notifyListeners();

      await getProperties();
    } finally {
      isRefreshing = false;
      notifyListeners();
    }
  }

  // =====================
  // FILTERS
  // =====================
  Future<void> setType(String type) async {
    filter.type = type == "All" ? null : type;
    await refresh();
  }

  Future<void> setCity(String city) async {
    filter.city = city.trim().isEmpty ? null : city;
    await refresh();
  }

  Future<void> setListingType(String listingType) async {
    filter.listingType = listingType == "All" ? null : listingType;
    await refresh();
  }

  // =====================
  // CLEAR ALL FILTERS
  // =====================
  Future<void> clearFilters() async {
    filter = FilterPropertyModel();
    searchText = "";

    await refresh();
  }
}

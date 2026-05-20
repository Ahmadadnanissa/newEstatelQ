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

  int page = 1;

  final int limit = 5;

  Future<void> getProperties() async {
    if (isLoading || !hasMore) {
      return;
    }
    error = null;
    try {
      isLoading = true;

      notifyListeners();

      final result = await useCase.execute(
        page: page,
        limit: limit,
        filter: filter,
      );

      if (result.isEmpty) {
        hasMore = false;
      } else {
        properties.addAll(result);

        page++;
      }
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;

    notifyListeners();
  }

  Future<void> refresh() async {
    page = 1;

    hasMore = true;
    error = null;
    properties.clear();

    await getProperties();
  }

  void setType(String type) async {
    filter.type = type == "All" ? null : type;

    await refresh();
  }

  void setLocation(String location) {
    filter.location = location.isEmpty ? null : location;
  }
}

import 'dart:async';

import 'package:estatelqapp/features/virtual_tour_feature/domain/entities/virtual_tour.dart';
import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';
import 'package:flutter/foundation.dart';


class VirtualTourViewProvider extends ChangeNotifier {
  VirtualTourViewProvider({
    required this.repository,
    required this.scopeId,
  });

  final VirtualTourRepository repository;
  final String scopeId;

  StreamSubscription<List<VirtualTour>>? _subscription;

  VirtualTour? latestTour;

  bool isLoading = true;
  String? error;

  void loadLatestTour() {
    isLoading = true;
    error = null;
    notifyListeners();

    _subscription?.cancel();

    _subscription = repository
        .watchTours(scopeId, publishedOnly: false)
        .listen(
          (tours) {
            if (tours.isEmpty) {
              latestTour = null;
            } else {
              latestTour = tours.first;
            }

            isLoading = false;
            error = null;
            notifyListeners();
          },
          onError: (Object e) {
            isLoading = false;
            error = e.toString();
            notifyListeners();
          },
        );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
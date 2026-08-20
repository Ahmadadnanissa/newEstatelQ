import 'package:estatelqapp/features/virtual_tour_feature/domain/entities/virtual_tour.dart';
import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';
import 'package:flutter/foundation.dart';

class VirtualTourViewProvider extends ChangeNotifier {
  VirtualTourViewProvider({required this.repository, required this.scopeId});

  final VirtualTourRepository repository;
  final String scopeId;

  VirtualTour? latestTour;

  bool isLoading = false;
  String? error;

  Future<void> loadLatestTour() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final tour = await repository.getLatestTour(
        scopeId,
        publishedOnly: false,
      );

      latestTour = tour;

      if (tour != null) {
        debugPrint('🔥 Latest Virtual Tour loaded');
        debugPrint('📌 Tour ID: ${tour.id}');
        debugPrint('📌 Title: ${tour.title}');
        debugPrint('📌 Scope ID: ${tour.scopeId}');
      } else {
        debugPrint('⚠️ No Virtual Tour found');
      }
    } catch (e) {
      latestTour = null;
      error = e.toString();

      debugPrint('❌ Failed to load latest Virtual Tour: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

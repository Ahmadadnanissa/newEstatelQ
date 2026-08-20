import '../entities/hotspot.dart';
import '../entities/room.dart';
import '../entities/virtual_tour.dart';

abstract interface class VirtualTourRepository {
  Stream<List<VirtualTour>> watchTours(
    String scopeId, {
    bool publishedOnly = false,
  });
  Future<VirtualTour?> getLatestTour(
    String scopeId, {
    bool publishedOnly = false,
  });
  Future<VirtualTour?> getTour(String tourId);
  Future<void> saveTour(VirtualTour tour);
  Future<void> deleteTour(String tourId);
  Stream<List<TourRoom>> watchRooms(String tourId);
  Future<void> saveRoom(TourRoom room);
  Future<void> deleteRoom(TourRoom room);
  Future<void> reorderRooms(List<TourRoom> rooms);
  Stream<List<TourHotspot>> watchHotspots(String roomId);
  Future<void> saveHotspot(TourHotspot hotspot);
  Future<void> deleteHotspot(TourHotspot hotspot);
}

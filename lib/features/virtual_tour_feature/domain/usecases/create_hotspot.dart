import '../entities/hotspot.dart';
import '../entities/room.dart';

class CreateHotspot {
  TourHotspot call({
    required String tourId,
    required String scopeId,
    required TourRoom sourceRoom,
    required double yaw,
    required double pitch,
    String? targetRoomId,
    String? label,
    HotspotType type = HotspotType.navigation,
  }) {
    return TourHotspot(
      id: _generateId(),
      tourId: tourId,
      scopeId: scopeId,
      sourceRoomId: sourceRoom.id,
      targetRoomId: targetRoomId,
      label: label,
      yaw: yaw,
      pitch: pitch,
      type: type,
      isEnabled: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  String _generateId() => '${DateTime.now().microsecondsSinceEpoch}_${_randomInt()}';
  int _randomInt() => DateTime.now().millisecond + 1000;
}

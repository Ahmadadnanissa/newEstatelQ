import '../entities/hotspot.dart';

class UpdateHotspot {
  TourHotspot call({
    required TourHotspot existing,
    double? yaw,
    double? pitch,
    String? targetRoomId,
    String? label,
    HotspotType? type,
    bool? isEnabled,
  }) {
    return existing.copyWith(
      yaw: yaw ?? existing.yaw,
      pitch: pitch ?? existing.pitch,
      targetRoomId: targetRoomId ?? existing.targetRoomId,
      label: label ?? existing.label,
      type: type ?? existing.type,
      isEnabled: isEnabled ?? existing.isEnabled,
      updatedAt: DateTime.now(),
    );
  }
}

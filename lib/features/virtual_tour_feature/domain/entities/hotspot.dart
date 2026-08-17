enum HotspotType { navigation, information }

class TourHotspot {
  const TourHotspot({
    required this.id, required this.tourId, required this.scopeId, required this.sourceRoomId,
    required this.yaw, required this.pitch, required this.type, required this.isEnabled,
    required this.createdAt, required this.updatedAt, this.targetRoomId, this.label,
  });
  final String id, tourId, scopeId, sourceRoomId;
  final String? targetRoomId, label;
  final double yaw, pitch;
  final HotspotType type;
  final bool isEnabled;
  final DateTime createdAt, updatedAt;
  TourHotspot copyWith({String? targetRoomId, String? label, double? yaw, double? pitch,
      HotspotType? type, bool? isEnabled, DateTime? updatedAt}) => TourHotspot(
    id: id, tourId: tourId, scopeId: scopeId, sourceRoomId: sourceRoomId,
    targetRoomId: targetRoomId ?? this.targetRoomId, label: label ?? this.label,
    yaw: yaw ?? this.yaw, pitch: pitch ?? this.pitch, type: type ?? this.type,
    isEnabled: isEnabled ?? this.isEnabled, createdAt: createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
}

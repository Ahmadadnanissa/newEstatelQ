import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/hotspot.dart';

class HotspotModel {
  const HotspotModel({
    required this.id,
    required this.tourId,
    required this.scopeId,
    required this.sourceRoomId,
    this.targetRoomId,
    this.label,
    required this.yaw,
    required this.pitch,
    required this.type,
    required this.isEnabled,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String tourId;
  final String scopeId;
  final String sourceRoomId;
  final String? targetRoomId;
  final String? label;
  final double yaw;
  final double pitch;
  final HotspotType type;
  final bool isEnabled;
  final DateTime createdAt;
  final DateTime updatedAt;

  static HotspotModel fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return HotspotModel(
      id: doc.id,
      tourId: data['tourId'] as String,
      scopeId: data['scopeId'] as String,
      sourceRoomId: data['sourceRoomId'] as String,
      targetRoomId: data['targetRoomId'] as String?,
      label: data['label'] as String?,
      yaw: (data['yaw'] as num).toDouble(),
      pitch: (data['pitch'] as num).toDouble(),
      type: HotspotType.values.byName(data['type'] as String),
      isEnabled: data['isEnabled'] as bool? ?? true,
      createdAt: _parseDateTime(data['createdAt']),
      updatedAt: _parseDateTime(data['updatedAt']),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'tourId': tourId,
      'scopeId': scopeId,
      'sourceRoomId': sourceRoomId,
      'targetRoomId': targetRoomId,
      'label': label,
      'yaw': yaw,
      'pitch': pitch,
      'type': type.name,
      'isEnabled': isEnabled,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  TourHotspot toEntity() {
    return TourHotspot(
      id: id,
      tourId: tourId,
      scopeId: scopeId,
      sourceRoomId: sourceRoomId,
      targetRoomId: targetRoomId,
      label: label,
      yaw: yaw,
      pitch: pitch,
      type: type,
      isEnabled: isEnabled,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static HotspotModel fromEntity(TourHotspot entity) {
    return HotspotModel(
      id: entity.id,
      tourId: entity.tourId,
      scopeId: entity.scopeId,
      sourceRoomId: entity.sourceRoomId,
      targetRoomId: entity.targetRoomId,
      label: entity.label,
      yaw: entity.yaw,
      pitch: entity.pitch,
      type: entity.type,
      isEnabled: entity.isEnabled,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  static DateTime _parseDateTime(dynamic value) {
    if (value is Timestamp) {
      return value.toDate();
    }
    if (value is DateTime) {
      return value;
    }
    return DateTime.fromMillisecondsSinceEpoch(0);
  }
}

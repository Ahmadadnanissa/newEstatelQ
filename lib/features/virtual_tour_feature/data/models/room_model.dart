import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/room.dart';

class RoomModel {
  const RoomModel({
    required this.id,
    required this.tourId,
    required this.scopeId,
    required this.name,
    required this.panoramaUrl,
    this.storageAssetId,
    required this.sortOrder,
    required this.hotspotCount,
    this.panoramaWidth,
    this.panoramaHeight,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String tourId;
  final String scopeId;
  final String name;
  final String panoramaUrl;
  final String? storageAssetId;
  final int sortOrder;
  final int hotspotCount;
  final int? panoramaWidth;
  final int? panoramaHeight;
  final DateTime createdAt;
  final DateTime updatedAt;

  static RoomModel fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return RoomModel(
      id: doc.id,
      tourId: data['tourId'] as String,
      scopeId: data['scopeId'] as String,
      name: data['name'] as String,
      panoramaUrl: data['panoramaUrl'] as String,
      storageAssetId: data['storageAssetId'] as String?,
      sortOrder: (data['sortOrder'] as num).toInt(),
      hotspotCount: (data['hotspotCount'] as num?)?.toInt() ?? 0,
      panoramaWidth: (data['panoramaWidth'] as num?)?.toInt(),
      panoramaHeight: (data['panoramaHeight'] as num?)?.toInt(),
      createdAt: _parseDateTime(data['createdAt']),
      updatedAt: _parseDateTime(data['updatedAt']),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'tourId': tourId,
      'scopeId': scopeId,
      'name': name,
      'panoramaUrl': panoramaUrl,
      'storageAssetId': storageAssetId,
      'sortOrder': sortOrder,
      'hotspotCount': hotspotCount,
      'panoramaWidth': panoramaWidth,
      'panoramaHeight': panoramaHeight,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  TourRoom toEntity() {
    return TourRoom(
      id: id,
      tourId: tourId,
      scopeId: scopeId,
      name: name,
      panoramaUrl: panoramaUrl,
      storageAssetId: storageAssetId,
      sortOrder: sortOrder,
      hotspotCount: hotspotCount,
      panoramaWidth: panoramaWidth,
      panoramaHeight: panoramaHeight,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static RoomModel fromEntity(TourRoom entity) {
    return RoomModel(
      id: entity.id,
      tourId: entity.tourId,
      scopeId: entity.scopeId,
      name: entity.name,
      panoramaUrl: entity.panoramaUrl,
      storageAssetId: entity.storageAssetId,
      sortOrder: entity.sortOrder,
      hotspotCount: entity.hotspotCount,
      panoramaWidth: entity.panoramaWidth,
      panoramaHeight: entity.panoramaHeight,
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

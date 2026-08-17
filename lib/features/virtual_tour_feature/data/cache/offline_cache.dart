import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/hotspot.dart';
import '../../domain/entities/room.dart';
import '../../domain/entities/virtual_tour.dart';
import 'cache_key.dart';

class OfflineCache {
  OfflineCache._();
  static final OfflineCache instance = OfflineCache._();

  static const Duration _cacheValidity = Duration(hours: 24);

  Future<bool> isCacheValid(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final timestamp = prefs.getInt(CacheKey.timestamp(key));
    if (timestamp == null) return false;

    final cachedTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateTime.now().difference(cachedTime) < _cacheValidity;
  }

  Future<void> invalidate(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    await prefs.remove(CacheKey.timestamp(key));
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for (final key in keys) {
      if (key.startsWith('vt_')) {
        await prefs.remove(key);
      }
    }
  }

  // Tour caching
  Future<void> cacheTour(VirtualTour tour) async {
    final prefs = await SharedPreferences.getInstance();
    final key = CacheKey.tour(tour.id);
    await prefs.setString(key, jsonEncode(_tourToJson(tour)));
    await prefs.setInt(
      CacheKey.timestamp(key),
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  Future<VirtualTour?> getCachedTour(String tourId) async {
    if (!await isCacheValid(CacheKey.tour(tourId))) return null;

    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(CacheKey.tour(tourId));
    if (data == null) return null;

    return _tourFromJson(jsonDecode(data));
  }

  // Rooms caching
  Future<void> cacheRooms(String tourId, List<TourRoom> rooms) async {
    final prefs = await SharedPreferences.getInstance();
    final key = CacheKey.rooms(tourId);
    await prefs.setString(key, jsonEncode(rooms.map(_roomToJson).toList()));
    await prefs.setInt(
      CacheKey.timestamp(key),
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  Future<List<TourRoom>?> getCachedRooms(String tourId) async {
    if (!await isCacheValid(CacheKey.rooms(tourId))) return null;

    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(CacheKey.rooms(tourId));
    if (data == null) return null;

    final List<dynamic> jsonList = jsonDecode(data);
    return jsonList
        .map((json) => _roomFromJson(json as Map<String, dynamic>))
        .toList();
  }

  // Hotspots caching
  Future<void> cacheHotspots(String roomId, List<TourHotspot> hotspots) async {
    final prefs = await SharedPreferences.getInstance();
    final key = CacheKey.hotspots(roomId);
    await prefs.setString(
      key,
      jsonEncode(hotspots.map(_hotspotToJson).toList()),
    );
    await prefs.setInt(
      CacheKey.timestamp(key),
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  Future<List<TourHotspot>?> getCachedHotspots(String roomId) async {
    if (!await isCacheValid(CacheKey.hotspots(roomId))) return null;

    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(CacheKey.hotspots(roomId));
    if (data == null) return null;

    final List<dynamic> jsonList = jsonDecode(data);
    return jsonList
        .map((json) => _hotspotFromJson(json as Map<String, dynamic>))
        .toList();
  }

  // JSON serialization helpers
  Map<String, dynamic> _tourToJson(VirtualTour tour) {
    return {
      'id': tour.id,
      'scopeId': tour.scopeId,
      'title': tour.title,
      'description': tour.description,
      'coverImageUrl': tour.coverImageUrl,
      'status': tour.status.name,
      'roomCount': tour.roomCount,
      'createdAt': tour.createdAt.toIso8601String(),
      'updatedAt': tour.updatedAt.toIso8601String(),
      'createdBy': tour.createdBy,
      'schemaVersion': tour.schemaVersion,
    };
  }

  VirtualTour _tourFromJson(Map<String, dynamic> json) {
    return VirtualTour(
      id: json['id'] as String,
      scopeId: json['scopeId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      coverImageUrl: json['coverImageUrl'] as String?,
      status: VirtualTourStatus.values.byName(json['status'] as String),
      roomCount: json['roomCount'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      createdBy: json['createdBy'] as String,
      schemaVersion: json['schemaVersion'] as int,
    );
  }

  Map<String, dynamic> _roomToJson(TourRoom room) {
    return {
      'id': room.id,
      'tourId': room.tourId,
      'scopeId': room.scopeId,
      'name': room.name,
      'panoramaUrl': room.panoramaUrl,
      'storageAssetId': room.storageAssetId,
      'sortOrder': room.sortOrder,
      'hotspotCount': room.hotspotCount,
      'panoramaWidth': room.panoramaWidth,
      'panoramaHeight': room.panoramaHeight,
      'createdAt': room.createdAt.toIso8601String(),
      'updatedAt': room.updatedAt.toIso8601String(),
    };
  }

  TourRoom _roomFromJson(Map<String, dynamic> json) {
    return TourRoom(
      id: json['id'] as String,
      tourId: json['tourId'] as String,
      scopeId: json['scopeId'] as String,
      name: json['name'] as String,
      panoramaUrl: json['panoramaUrl'] as String,
      storageAssetId: json['storageAssetId'] as String?,
      sortOrder: json['sortOrder'] as int,
      hotspotCount: json['hotspotCount'] as int,
      panoramaWidth: json['panoramaWidth'] as int?,
      panoramaHeight: json['panoramaHeight'] as int?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> _hotspotToJson(TourHotspot hotspot) {
    return {
      'id': hotspot.id,
      'tourId': hotspot.tourId,
      'scopeId': hotspot.scopeId,
      'sourceRoomId': hotspot.sourceRoomId,
      'targetRoomId': hotspot.targetRoomId,
      'label': hotspot.label,
      'yaw': hotspot.yaw,
      'pitch': hotspot.pitch,
      'type': hotspot.type.name,
      'isEnabled': hotspot.isEnabled,
      'createdAt': hotspot.createdAt.toIso8601String(),
      'updatedAt': hotspot.updatedAt.toIso8601String(),
    };
  }

  TourHotspot _hotspotFromJson(Map<String, dynamic> json) {
    return TourHotspot(
      id: json['id'] as String,
      tourId: json['tourId'] as String,
      scopeId: json['scopeId'] as String,
      sourceRoomId: json['sourceRoomId'] as String,
      targetRoomId: json['targetRoomId'] as String?,
      label: json['label'] as String?,
      yaw: (json['yaw'] as num).toDouble(),
      pitch: (json['pitch'] as num).toDouble(),
      type: HotspotType.values.byName(json['type'] as String),
      isEnabled: json['isEnabled'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}

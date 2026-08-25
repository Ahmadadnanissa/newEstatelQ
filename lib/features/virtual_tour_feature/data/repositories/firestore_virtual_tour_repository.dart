import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estatelqapp/core/services/building_number_local_storage.dart';
import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';

import '../../domain/entities/hotspot.dart';
import '../../domain/entities/room.dart';
import '../../domain/entities/virtual_tour.dart';

class FirestoreVirtualTourRepository implements VirtualTourRepository {
  FirestoreVirtualTourRepository(this._db);
  final FirebaseFirestore _db;
  CollectionReference<Map<String, dynamic>> get _tours =>
      _db.collection('virtual_tours');
  CollectionReference<Map<String, dynamic>> get _rooms =>
      _db.collection('rooms');
  CollectionReference<Map<String, dynamic>> get _hotspots =>
      _db.collection('hotspots');

  @override
  Stream<List<VirtualTour>> watchTours(
    String scopeId, {
    bool publishedOnly = false,
  }) {
    Query<Map<String, dynamic>> query = _tours.where(
      'scopeId',
      isEqualTo: scopeId,
    );
    if (publishedOnly) query = query.where('status', isEqualTo: 'published');
    return query
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((s) => s.docs.map(_tour).toList());
  }

  @override
  Future<VirtualTour?> getLatestTour(
    String scopeId, {
    bool publishedOnly = false,
  }) async {
    final buildingNumber = BuildingNumberLocalStorage.getBuildingNumber();

    Query<Map<String, dynamic>> query = _tours.where(
      'scopeId',
      isEqualTo: buildingNumber,
    );

    if (publishedOnly) {
      query = query.where('status', isEqualTo: 'published');
    }

    final snapshot = await query
        .orderBy('updatedAt', descending: true)
        .limit(1)
        .get(const GetOptions(source: Source.server));

    if (snapshot.docs.isEmpty) {
      return null;
    }

    return _tour(snapshot.docs.first);
  }

  @override
  Future<VirtualTour?> getTour(String tourId) async {
    final doc = await _tours.doc(tourId).get();
    return doc.exists ? _tour(doc) : null;
  }

  @override
  Future<void> saveTour(VirtualTour tour) =>
      _tours.doc(tour.id).set(_tourMap(tour), SetOptions(merge: true));

  @override
  Future<void> deleteTour(String tourId) async {
    // Firestore has no cascading delete. Remove children first in bounded batches.
    final rooms = await _rooms.where('tourId', isEqualTo: tourId).get();
    for (final room in rooms.docs) {
      final hotspots = await _hotspots
          .where('sourceRoomId', isEqualTo: room.id)
          .get();
      final batch = _db.batch();
      for (final hotspot in hotspots.docs) {
        batch.delete(hotspot.reference);
      }
      batch.delete(room.reference);
      await batch.commit();
    }
    await _tours.doc(tourId).delete();
  }

  @override
  Stream<List<TourRoom>> watchRooms(String tourId) => _rooms
      .where('tourId', isEqualTo: tourId)
      .orderBy('sortOrder')
      .snapshots()
      .map((s) => s.docs.map(_room).toList());

  @override
  Future<void> saveRoom(TourRoom room) =>
      _rooms.doc(room.id).set(_roomMap(room), SetOptions(merge: true));

  @override
  Future<void> deleteRoom(TourRoom room) async {
    final hotspots = await _hotspots
        .where('sourceRoomId', isEqualTo: room.id)
        .get();
    final batch = _db.batch();
    for (final hotspot in hotspots.docs) {
      batch.delete(hotspot.reference);
    }
    batch.delete(_rooms.doc(room.id));
    await batch.commit();
  }

  @override
  Future<void> reorderRooms(List<TourRoom> rooms) async {
    final batch = _db.batch();
    for (var index = 0; index < rooms.length; index++) {
      batch.update(_rooms.doc(rooms[index].id), {
        'sortOrder': index,
        'updatedAt': Timestamp.now(),
      });
    }
    await batch.commit();
  }

  @override
  Stream<List<TourHotspot>> watchHotspots(String roomId) => _hotspots
      .where('sourceRoomId', isEqualTo: roomId)
      .orderBy('createdAt')
      .snapshots()
      .map((s) => s.docs.map(_hotspot).toList());

  @override
  Future<void> saveHotspot(TourHotspot hotspot) => _hotspots
      .doc(hotspot.id)
      .set(_hotspotMap(hotspot), SetOptions(merge: true));

  @override
  Future<void> deleteHotspot(TourHotspot hotspot) =>
      _hotspots.doc(hotspot.id).delete();

  VirtualTour _tour(DocumentSnapshot<Map<String, dynamic>> d) {
    final m = d.data()!;
    return VirtualTour(
      id: d.id,
      scopeId: m['scopeId'] as String,
      title: m['title'] as String,
      description: m['description'] as String?,
      coverImageUrl: m['coverImageUrl'] as String?,
      status: VirtualTourStatus.values.byName(m['status'] as String),
      roomCount: (m['roomCount'] as num?)?.toInt() ?? 0,
      createdAt: _time(m['createdAt']),
      updatedAt: _time(m['updatedAt']),
      createdBy: m['createdBy'] as String,
      schemaVersion: (m['schemaVersion'] as num?)?.toInt() ?? 1,
    );
  }

  TourRoom _room(DocumentSnapshot<Map<String, dynamic>> d) {
    final m = d.data()!;
    return TourRoom(
      id: d.id,
      tourId: m['tourId'] as String,
      scopeId: m['scopeId'] as String,
      name: m['name'] as String,
      panoramaUrl: m['panoramaUrl'] as String,
      storageAssetId: m['storageAssetId'] as String?,
      sortOrder: (m['sortOrder'] as num).toInt(),
      hotspotCount: (m['hotspotCount'] as num?)?.toInt() ?? 0,
      panoramaWidth: (m['panoramaWidth'] as num?)?.toInt(),
      panoramaHeight: (m['panoramaHeight'] as num?)?.toInt(),
      createdAt: _time(m['createdAt']),
      updatedAt: _time(m['updatedAt']),
    );
  }

  TourHotspot _hotspot(DocumentSnapshot<Map<String, dynamic>> d) {
    final m = d.data()!;
    return TourHotspot(
      id: d.id,
      tourId: m['tourId'] as String,
      scopeId: m['scopeId'] as String,
      sourceRoomId: m['sourceRoomId'] as String,
      targetRoomId: m['targetRoomId'] as String?,
      label: m['label'] as String?,
      yaw: (m['yaw'] as num).toDouble(),
      pitch: (m['pitch'] as num).toDouble(),
      type: HotspotType.values.byName(m['type'] as String),
      isEnabled: m['isEnabled'] as bool? ?? true,
      createdAt: _time(m['createdAt']),
      updatedAt: _time(m['updatedAt']),
    );
  }

  DateTime _time(dynamic value) => value is Timestamp
      ? value.toDate()
      : DateTime.fromMillisecondsSinceEpoch(0);
  Map<String, dynamic> _tourMap(VirtualTour x) => {
    'scopeId': x.scopeId,
    'title': x.title,
    'description': x.description,
    'coverImageUrl': x.coverImageUrl,
    'status': x.status.name,
    'roomCount': x.roomCount,
    'createdAt': Timestamp.fromDate(x.createdAt),
    'updatedAt': Timestamp.fromDate(x.updatedAt),
    'createdBy': x.createdBy,
    'schemaVersion': x.schemaVersion,
  };
  Map<String, dynamic> _roomMap(TourRoom x) => {
    'tourId': x.tourId,
    'scopeId': x.scopeId,
    'name': x.name,
    'panoramaUrl': x.panoramaUrl,
    'storageAssetId': x.storageAssetId,
    'sortOrder': x.sortOrder,
    'hotspotCount': x.hotspotCount,
    'panoramaWidth': x.panoramaWidth,
    'panoramaHeight': x.panoramaHeight,
    'createdAt': Timestamp.fromDate(x.createdAt),
    'updatedAt': Timestamp.fromDate(x.updatedAt),
  };
  Map<String, dynamic> _hotspotMap(TourHotspot x) => {
    'tourId': x.tourId,
    'scopeId': x.scopeId,
    'sourceRoomId': x.sourceRoomId,
    'targetRoomId': x.targetRoomId,
    'label': x.label,
    'yaw': x.yaw,
    'pitch': x.pitch,
    'type': x.type.name,
    'isEnabled': x.isEnabled,
    'createdAt': Timestamp.fromDate(x.createdAt),
    'updatedAt': Timestamp.fromDate(x.updatedAt),
  };
}

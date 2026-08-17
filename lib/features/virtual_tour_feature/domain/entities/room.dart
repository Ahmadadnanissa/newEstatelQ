class TourRoom {
  const TourRoom({
    required this.id, required this.tourId, required this.scopeId, required this.name,
    required this.panoramaUrl, required this.sortOrder, required this.createdAt, required this.updatedAt,
    this.storageAssetId, this.panoramaWidth, this.panoramaHeight, this.hotspotCount = 0,
  });
  final String id, tourId, scopeId, name, panoramaUrl;
  final String? storageAssetId;
  final int sortOrder, hotspotCount;
  final int? panoramaWidth, panoramaHeight;
  final DateTime createdAt, updatedAt;
  TourRoom copyWith({String? name, String? panoramaUrl, String? storageAssetId, int? sortOrder, int? hotspotCount, int? panoramaWidth, int? panoramaHeight, DateTime? updatedAt}) => TourRoom(
    id: id, tourId: tourId, scopeId: scopeId, name: name ?? this.name,
    panoramaUrl: panoramaUrl ?? this.panoramaUrl, storageAssetId: storageAssetId ?? this.storageAssetId,
    sortOrder: sortOrder ?? this.sortOrder, hotspotCount: hotspotCount ?? this.hotspotCount,
    panoramaWidth: panoramaWidth ?? this.panoramaWidth, panoramaHeight: panoramaHeight ?? this.panoramaHeight, createdAt: createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
}

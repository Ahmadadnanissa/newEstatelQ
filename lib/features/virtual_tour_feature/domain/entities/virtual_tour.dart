enum VirtualTourStatus { draft, published, archived }

class VirtualTour {
  const VirtualTour({
    required this.id,
    required this.scopeId,
    required this.title,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.description,
    this.coverImageUrl,
    this.roomCount = 0,
    this.schemaVersion = 1,
  });

  final String id;
  final String scopeId;
  final String title;
  final String? description;
  final String? coverImageUrl;
  final VirtualTourStatus status;
  final int roomCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdBy;
  final int schemaVersion;

  VirtualTour copyWith({String? title, String? description, String? coverImageUrl,
      VirtualTourStatus? status, int? roomCount, DateTime? updatedAt}) => VirtualTour(
    id: id, scopeId: scopeId, title: title ?? this.title,
    description: description ?? this.description, coverImageUrl: coverImageUrl ?? this.coverImageUrl,
    status: status ?? this.status, roomCount: roomCount ?? this.roomCount,
    createdAt: createdAt, updatedAt: updatedAt ?? this.updatedAt, createdBy: createdBy,
    schemaVersion: schemaVersion,
  );
}

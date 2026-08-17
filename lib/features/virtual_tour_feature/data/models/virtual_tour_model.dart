import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/virtual_tour.dart';

class VirtualTourModel {
  const VirtualTourModel({
    required this.id,
    required this.scopeId,
    required this.title,
    this.description,
    this.coverImageUrl,
    required this.status,
    required this.roomCount,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.schemaVersion,
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

  static VirtualTourModel fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return VirtualTourModel(
      id: doc.id,
      scopeId: data['scopeId'] as String,
      title: data['title'] as String,
      description: data['description'] as String?,
      coverImageUrl: data['coverImageUrl'] as String?,
      status: VirtualTourStatus.values.byName(data['status'] as String),
      roomCount: (data['roomCount'] as num?)?.toInt() ?? 0,
      createdAt: _parseDateTime(data['createdAt']),
      updatedAt: _parseDateTime(data['updatedAt']),
      createdBy: data['createdBy'] as String,
      schemaVersion: (data['schemaVersion'] as num?)?.toInt() ?? 1,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'scopeId': scopeId,
      'title': title,
      'description': description,
      'coverImageUrl': coverImageUrl,
      'status': status.name,
      'roomCount': roomCount,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'createdBy': createdBy,
      'schemaVersion': schemaVersion,
    };
  }

  VirtualTour toEntity() {
    return VirtualTour(
      id: id,
      scopeId: scopeId,
      title: title,
      description: description,
      coverImageUrl: coverImageUrl,
      status: status,
      roomCount: roomCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      schemaVersion: schemaVersion,
    );
  }

  static VirtualTourModel fromEntity(VirtualTour entity) {
    return VirtualTourModel(
      id: entity.id,
      scopeId: entity.scopeId,
      title: entity.title,
      description: entity.description,
      coverImageUrl: entity.coverImageUrl,
      status: entity.status,
      roomCount: entity.roomCount,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      createdBy: entity.createdBy,
      schemaVersion: entity.schemaVersion,
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

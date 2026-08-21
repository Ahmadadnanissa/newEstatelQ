import 'balcony_data.dart';

class RoomItem {
  final String type;
  final double size;
  final String description;
  final String paintDescription;
  final List<String> photos;
  final bool hasBalcony;
  final BalconyData? balconyData;
  final Map<String, dynamic>? data;

  const RoomItem({
    required this.type,
    required this.size,
    required this.description,
    required this.paintDescription,
    required this.photos,
    required this.hasBalcony,
    this.balconyData,
    this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'size': size,

      // Backend expects Object, not null
      'data': data ?? {},

      'photos': photos,
      'description': description,
      'paintDescription': paintDescription,
      'hasBalcony': hasBalcony,
      'balconyData': balconyData?.toJson(),
    };
  }

  factory RoomItem.fromJson(Map<String, dynamic> json) {
    final roomData = json['data'];

    return RoomItem(
      type: json['type']?.toString() ?? '',
      size: (json['size'] as num?)?.toDouble() ?? 0,
      description: json['description']?.toString() ?? '',
      paintDescription: json['paintDescription']?.toString() ?? '',

      photos: List<String>.from(json['photos'] ?? []),

      hasBalcony: json['hasBalcony'] ?? false,

      balconyData: json['balconyData'] is Map
          ? BalconyData.fromJson(Map<String, dynamic>.from(json['balconyData']))
          : null,

      data: roomData is Map ? Map<String, dynamic>.from(roomData) : {},
    );
  }
}

class RoomItemModel {
  final String id;
  final String type;
  final double? size;
  final Map<String, dynamic>? data;
  final List<String>? photos;
  final String? description;
  final String? paintDescription;
  final bool hasBalcony;

  final Map<String, dynamic>? balconyData;

  RoomItemModel({
    required this.id,
    required this.type,
    this.size,
    this.data,
    this.photos,
    this.description,
    this.paintDescription,
    required this.hasBalcony,
    this.balconyData,
  });

  factory RoomItemModel.fromJson(Map<String, dynamic> json) {
    return RoomItemModel(
      id: json["id"],

      type: json["type"],

      size: json["size"]?.toDouble(),

      data: json["data"],

      photos: json["photos"] == null ? [] : List<String>.from(json["photos"]),

      description: json["description"],

      paintDescription: json["paintDescription"],

      hasBalcony: json["hasBalcony"] ?? false,

      balconyData: json["balconyData"],
    );
  }
}

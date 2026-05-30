// class Room {
//   final String id;
//   final String name;
//   final String type;
//   final String description;
//   final List<String> images;

//   Room({
//     required this.id,
//     required this.name,
//     required this.type,
//     required this.description,
//     required this.images,
//   });

//   factory Room.fromJson(Map<String, dynamic> json) {
//     return Room(
//       id: json['id'],
//       name: json['name'],
//       type: json['type'],
//       description: json['description'],
//       images: List<String>.from(json['images']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'type': type,
//       'description': description,
//       'images': images,
//     };
//   }
// }

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

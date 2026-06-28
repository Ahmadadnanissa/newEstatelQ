class OutdoorItemModel {
  final String id;

  final String type;

  final Map<String, dynamic>? data;

  final String? description;

  final List<String> photos;

  OutdoorItemModel({
    required this.id,
    required this.type,
    this.data,
    this.description,
    required this.photos,
  });

  factory OutdoorItemModel.fromJson(Map<String, dynamic> json) {
    return OutdoorItemModel(
      id: json["id"],

      type: json["type"],

      data: json["data"],

      description: json["description"],

      photos: List<String>.from(json["photos"] ?? []),
    );
  }
}

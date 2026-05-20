class PropertyCardModel {
  final String id;

  final String title;

  final List<String> images;

  final String location;

  final double price;

  final String type;

  final int rooms;

  final int bathrooms;

  final double sqft;

  PropertyCardModel({
    required this.id,
    required this.title,
    required this.images,
    required this.location,
    required this.price,
    required this.type,
    required this.rooms,
    required this.bathrooms,
    required this.sqft,
  });

  factory PropertyCardModel.fromJson(Map<String, dynamic> json) {
    return PropertyCardModel(
      id: json["id"],

      title: json["title"],

      images: List<String>.from(json["images"] ?? []),

      location: json["location"],

      price: (json["price"] as num).toDouble(),

      type: json["type"],

      rooms: json["rooms"],

      bathrooms: json["bathrooms"],

      sqft: (json["sqft"] as num).toDouble(),
    );
  }
}

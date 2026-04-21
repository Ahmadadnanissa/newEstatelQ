class Room {
  final String id;
  final String name;
  final String type;
  final String description;
  final List<String> images;

  Room({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.images,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      description: json['description'],
      images: List<String>.from(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'description': description,
      'images': images,
    };
  }
}

class ClientModel {
  final String? id;

  final String? name;
  final String? email;
  final String? phone;
  final String? image;

  final String? location;

  final double? latitude;
  final double? longitude;

  final String userType;

  ClientModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.location,
    this.latitude,
    this.longitude,
    this.userType = "guest",
    this.image,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      location: json['location'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      userType: json['userType'] ?? "guest",
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "location": location,
      "latitude": latitude,
      "longitude": longitude,
      "userType": userType,
      "image": image,
    };
  }
}

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
    final clientData = json['client'] ?? {};

    return ClientModel(
      id: json['id'],
      email: json['email'],

      name: clientData['name'],
      phone: clientData['phone'],
      location: clientData['location'],
      image: clientData['photo'],
      latitude: clientData['latitude'],
      longitude: clientData['longitude'],

      userType: json['role'] ?? 'guest',
    );
  }
}

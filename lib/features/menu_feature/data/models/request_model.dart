class RequestModel {
  final String title;
  final double price;
  final double area;
  final int rooms;
  final int bathrooms;
  final String location;
  final String type;
  final String status;
  final bool parking;
  final bool swimmingPool;
  final bool furnished;
  final bool heating;
  final double lat;
  final double lng;
  final List<String> images;
  RequestModel({
    required this.title,
    required this.price,
    required this.area,
    required this.rooms,
    required this.bathrooms,
    required this.location,
    required this.type,
    required this.status,
    required this.parking,
    required this.swimmingPool,
    required this.furnished,
    required this.heating,

    required this.lat,
    required this.lng,
    required this.images,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "price": price,
      "area": area,
      "rooms": rooms,
      "bathrooms": bathrooms,
      "location": location,
      "type": type,
      "status": status,
      "parking": parking,
      "swimming_pool": swimmingPool,
      "furnished": furnished,
      "heating": heating,

      "lat": lat,
      "lng": lng,
      "images": images,
    };
  }

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      title: json["title"],
      price: (json["price"] as num).toDouble(),
      area: (json["area"] as num).toDouble(),
      rooms: json["rooms"],
      bathrooms: json["bathrooms"],
      location: json["location"],
      type: json["type"],
      status: json["status"],
      parking: json["parking"],
      swimmingPool: json["swimming_pool"],
      furnished: json["furnished"],
      heating: json["heating"],
      lat: json["lat"],
      lng: json["lng"],
      images: json["images"],
    );
  }
}

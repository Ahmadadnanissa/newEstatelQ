class PropertyCardModel {
  final String id;

  final String referenceCode;

  final String type;

  final String listingType;

  final String simpleDescription;

  final String city;

  final double listedPrice;

  final double sqft;

  final int numOfRooms;

  final int bathrooms;

  final String? primaryImage;

  PropertyCardModel({
    required this.id,
    required this.referenceCode,
    required this.type,
    required this.listingType,
    required this.simpleDescription,
    required this.city,
    required this.listedPrice,
    required this.sqft,
    required this.numOfRooms,
    required this.bathrooms,
    this.primaryImage,
  });

  factory PropertyCardModel.fromJson(Map<String, dynamic> json) {
    return PropertyCardModel(
      id: json["id"] ?? "",

      referenceCode: json["referenceCode"] ?? "",

      type: json["type"] ?? "",

      listingType: json["listingType"] ?? "",

      simpleDescription: json["simpleDescription"] ?? "",

      city: json["city"] ?? "",

      listedPrice: (json["listedPrice"] as num?)?.toDouble() ?? 0,

      sqft: (json["sqft"] as num?)?.toDouble() ?? 0,

      numOfRooms: json["numOfRooms"] ?? 0,

      bathrooms: json["bathrooms"] ?? 0,

      primaryImage: json["primaryImage"],
    );
  }
}

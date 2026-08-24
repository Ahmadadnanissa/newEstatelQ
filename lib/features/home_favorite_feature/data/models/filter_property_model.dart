class FilterPropertyModel {
  String? q;
  String? city;
  bool? trendy;
  bool? foryou;
  bool? collaborative;
  String? type;

  String? listingType;

  int? numOfRooms;

  double? minPrice;

  double? maxPrice;

  FilterPropertyModel({
    this.q,
    this.city,
    this.trendy,
    this.foryou,
    this.collaborative,
    this.type,
    this.listingType,
    this.numOfRooms,
    this.minPrice,
    this.maxPrice,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (city != null && city!.isNotEmpty) {
      data["city"] = city;
    }

    if (type != null && type!.isNotEmpty) {
      data["type"] = type;
    }

    if (listingType != null && listingType!.isNotEmpty) {
      data["listingType"] = listingType;
    }

    if (numOfRooms != null) {
      data["numOfRooms"] = numOfRooms;
    }

    if (minPrice != null) {
      data["listedPrice[gte]"] = minPrice;
    }

    if (maxPrice != null) {
      data["listedPrice[lte]"] = maxPrice;
    }
    if (q != null && q!.isNotEmpty) {
      data["q"] = q;
    }
    if (trendy == true) {
      data["trendy"] = true;
    }

    if (foryou == true) {
      data["foryou"] = true;
    }

    if (collaborative == true) {
      data["collaborative"] = true;
    }

    return data;
  }
}

class FilterPropertyModel {
  String? location;

  String? type;

  String? purpose;

  int? rooms;

  double? minPrice;

  double? maxPrice;

  FilterPropertyModel({
    this.location,
    this.type,
    this.purpose,
    this.rooms,
    this.minPrice,
    this.maxPrice,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (location != null) {
      data["location"] = location;
    }

    if (type != null) {
      data["type"] = type;
    }

    if (purpose != null) {
      data["purpose"] = purpose;
    }

    if (rooms != null) {
      data["rooms"] = rooms;
    }

    if (minPrice != null) {
      data["minPrice"] = minPrice;
    }

    if (maxPrice != null) {
      data["maxPrice"] = maxPrice;
    }

    return data;
  }
}

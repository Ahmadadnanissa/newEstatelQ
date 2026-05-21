import 'package:estatelqapp/features/property_details_feature/data/models/appartment_model.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/property_model.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/villa_mode.dart';

import 'house_model.dart';
import 'hall_model.dart';
import 'store_model.dart';

class PropertyFactory {
  static PropertyModel fromJson(Map<String, dynamic> json) {
    switch (json["type"]) {
      case "APARTMENT":
        return ApartmentModel.fromJson(json);

      case "VILLA":
        return VillaModel.fromJson(json);

      case "HOUSE":
        return HouseModel.fromJson(json);

      case "STORE":
        return StoreModel.fromJson(json);

      case "HALL":
        return HallModel.fromJson(json);

      default:
        throw Exception("Unknown property type");
    }
  }
}

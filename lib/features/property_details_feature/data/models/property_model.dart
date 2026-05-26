import 'package:estatelqapp/features/property_details_feature/data/models/outdoor_detail_model.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/room_model.dart';

abstract class PropertyModel {
  final String id;

  //final String requestId;

  //final String clientId;

  //final String referenceCode;

  //final String zipCode;

  final String type;

  final String listingType;

  final String? simpleDescription;

  final String? fullDescription;

  final String location;

  // final String city;

  final String? address;

  final double? latitude;

  final double? longitude;

  final int? rentalPeriod;

  final double listedPrice;

  final Map<String, dynamic>? area;

  final String heating;

  final String furnishing;

  final String primaryPhoto;

  final List<String> galleryPhotos;

  final int constructionYear;

  // final String status;

  final List<RoomItemModel> rooms;

  final List<OutdoorItemModel> outdoorItems;

  PropertyModel({
    required this.id,
    // required this.requestId,
    // required this.clientId,
    // required this.referenceCode,
    // required this.zipCode,
    required this.type,
    required this.listingType,
    this.simpleDescription,
    this.fullDescription,
    required this.location,
    // required this.city,
    this.address,
    this.latitude,
    this.longitude,
    this.rentalPeriod,
    required this.listedPrice,
    this.area,
    required this.heating,
    required this.furnishing,
    required this.primaryPhoto,
    required this.galleryPhotos,
    required this.constructionYear,
    // required this.status,
    required this.rooms,
    required this.outdoorItems,
  });
}

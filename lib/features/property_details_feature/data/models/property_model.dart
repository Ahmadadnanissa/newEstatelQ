import 'package:estatelqapp/features/property_details_feature/data/models/outdoor_detail_model.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/room_model.dart';

class PropertyModel {
  final String id;

  /// 🏷️ Basic Info
  final String title;
  final String address;
  final String type;
  final String rentOrSale;
  final double price;

  /// ⭐ Reviews
  final double rating;
  final int reviewCount;

  /// 📝 Description
  final String description;

  /// 🖼️ Images
  final String primaryImage;
  final List<String> galleryImages;

  /// 🏠 Rooms
  final List<Room> rooms;

  /// 🌳 Outdoor
  final List<OutdoorDetail> outdoorDetails;

  /// 📍 Location
  final double latitude;
  final double longitude;

  /// 📌 Nearby
  final List<String> nearbyPlaces;

  /// 📐 More Details
  final OutdoorDetail areaDetail;
  final List<String> extraDetails;

  PropertyModel({
    required this.id,
    required this.title,
    required this.address,
    required this.type,
    required this.rentOrSale,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.primaryImage,
    required this.galleryImages,
    required this.rooms,
    required this.outdoorDetails,
    required this.latitude,
    required this.longitude,
    required this.nearbyPlaces,
    required this.areaDetail,
    required this.extraDetails,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      title: json['title'],
      address: json['address'],
      type: json['type'],
      rentOrSale: json['rent_or_sale'],
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['review_count'],
      description: json['description'],
      primaryImage: json['primary_image'],
      galleryImages: List<String>.from(json['gallery_images']),
      rooms: (json['rooms'] as List).map((e) => Room.fromJson(e)).toList(),
      outdoorDetails: (json['outdoor_details'] as List)
          .map((e) => OutdoorDetail.fromJson(e))
          .toList(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      nearbyPlaces: List<String>.from(json['nearby_places']),
      areaDetail: OutdoorDetail.fromJson(json['area_detail']),
      extraDetails: List<String>.from(json['extra_details']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'address': address,
      'type': type,
      'rent_or_sale': rentOrSale,
      'price': price,
      'rating': rating,
      'review_count': reviewCount,
      'description': description,
      'primary_image': primaryImage,
      'gallery_images': galleryImages,
      'rooms': rooms.map((e) => e.toJson()).toList(),
      'outdoor_details': outdoorDetails.map((e) => e.toJson()).toList(),
      'latitude': latitude,
      'longitude': longitude,
      'nearby_places': nearbyPlaces,
      'area_detail': areaDetail.toJson(),
      'extra_details': extraDetails,
    };
  }
}

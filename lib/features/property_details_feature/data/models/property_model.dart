import 'package:estatelqapp/features/property_details_feature/data/models/out_door_model.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/room_item.dart';

class PropertyModel {
  final String fullDescription;
  final String shortDescription;
  final String zipCode;
  final String propertyType;
  final List<String> galleryPhoto;
  final String askingPrice;
  final String listingType;
  final String cityName;
  final String location;
  final double lat;
  final double lon;
  final List<Map<String, dynamic>> nearByPlaces;
  final List<OutdoorItem> outDoors;
  final String sqftArea;
  final String constructionYear;
  final List<RoomItem> roomItems;
  final String heating;
  final String furnishing;
  final String? rentalPeriod;
  final bool fireplace;
  final bool hasBasement;
  final String? basementArea;
  final String internalGarageArea;
  final String finishingQuality;
  final String maintenanceLevel;
  final String neighborhoodScore;
  final String exteriorFinish;
  final String? floorNumber;
  final String? numberOfFloors;
  final bool elevator;
  final String requestId;
  final String? primaryPhoto;

  const PropertyModel({
    required this.fullDescription,
    required this.shortDescription,
    required this.zipCode,
    required this.propertyType,
    required this.galleryPhoto,
    required this.askingPrice,
    required this.listingType,
    required this.cityName,
    required this.location,
    required this.lat,
    required this.lon,
    required this.nearByPlaces,
    required this.outDoors,
    required this.sqftArea,
    required this.constructionYear,
    required this.roomItems,
    required this.heating,
    required this.furnishing,
    this.rentalPeriod,
    required this.fireplace,
    required this.hasBasement,
    this.basementArea,
    required this.internalGarageArea,
    required this.finishingQuality,
    required this.maintenanceLevel,
    required this.neighborhoodScore,
    required this.exteriorFinish,
    this.floorNumber,
    this.numberOfFloors,
    required this.elevator,
    required this.requestId,
    required this.primaryPhoto,
  });

  Map<String, dynamic> toJson() {
    return {
      "requestId": requestId,
      "zipCode": int.tryParse(zipCode),
      "type": propertyType,
      "listingType": listingType,
      "simpleDescription": shortDescription,
      "fullDescription": fullDescription,
      "location": location,
      "city": cityName,
      "address": "",
      "latitude": lat,
      "longitude": lon,
      "sqft": double.tryParse(sqftArea),
      "heating": heating,
      "furnishing": furnishing,
      "numOfFloors": int.tryParse(numberOfFloors ?? ""),
      "fireplace": fireplace,
      "hasBasement": hasBasement,
      "basementArea": double.tryParse(basementArea ?? ""),
      "internalGarageArea": double.tryParse(internalGarageArea),
      "primaryPhoto": primaryPhoto ?? '',
      "galleryPhoto": galleryPhoto,
      "nearbyPlaces": nearByPlaces,
      "finishingQuality": double.tryParse(finishingQuality),
      "maintenanceLevel": double.tryParse(maintenanceLevel),
      "neighborhoodScore": double.tryParse(neighborhoodScore),
      "exteriorFinish": double.tryParse(exteriorFinish),
      "constructionYear": int.tryParse(constructionYear),
      "roomItems": roomItems.map((e) => e.toJson()).toList(),
      "outdoorItems": outDoors.map((e) => e.toJson()).toList(),
    };
  }

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      fullDescription: json['fullDescription'] ?? '',
      shortDescription: json['simpleDescription'] ?? '',
      zipCode: json['zipCode']?.toString() ?? '',
      propertyType: json['type'] ?? '',
      galleryPhoto: List<String>.from(json['galleryPhoto'] ?? []),
      askingPrice: json['listedPrice']?.toString() ?? '',
      listingType: json['listingType'] ?? '',
      cityName: json['city'] ?? '',
      location: json['location'] ?? '',
      lat: (json['latitude'] as num?)?.toDouble() ?? 0,
      lon: (json['longitude'] as num?)?.toDouble() ?? 0,

      nearByPlaces: json['nearbyPlaces'] != null
          ? List<Map<String, dynamic>>.from(
              json['nearbyPlaces'].map((e) => Map<String, dynamic>.from(e)),
            )
          : [],

      //  json['nearbyPlaces'] != null
      //     ? (json['nearbyPlaces'] as Map<String, dynamic>).entries.expand((
      //         entry,
      //       ) {
      //         final list = entry.value as List;
      //         return list.map(
      //           (e) => {'category': entry.key, ...Map<String, dynamic>.from(e)},
      //         );
      //       }).toList()
      //     : [],
      outDoors: (json['outdoorItems'] as List? ?? [])
          .map((e) => OutdoorItem.fromJson(e))
          .toList(),

      sqftArea: json['sqft']?.toString() ?? '',
      constructionYear: json['constructionYear']?.toString() ?? '',

      roomItems: (json['roomItems'] as List? ?? [])
          .map((e) => RoomItem.fromJson(e))
          .toList(),

      heating: json['heating'] ?? '',
      furnishing: json['furnishing'] ?? '',
      rentalPeriod: json['rentalPeriod']?.toString(),
      fireplace: json['fireplace'] ?? false,
      hasBasement: json['hasBasement'] ?? false,
      basementArea: json['basementArea']?.toString(),
      internalGarageArea: json['internalGarageArea']?.toString() ?? '',
      finishingQuality: json['finishingQuality']?.toString() ?? '',
      maintenanceLevel: json['maintenanceLevel']?.toString() ?? '',
      neighborhoodScore: json['neighborhoodScore']?.toString() ?? '',
      exteriorFinish: json['exteriorFinish']?.toString() ?? '',
      floorNumber: json['floorNumber']?.toString(),
      numberOfFloors: json['numOfFloors']?.toString(),
      elevator: json['elevator'] ?? false,
      requestId: json['id'] ?? '',
      primaryPhoto: json['primaryPhoto'],
    );
  }
}

// import 'property_model.dart';
// import 'room_item_model.dart';
// import 'outdoor_item_model.dart';

// class VillaModel extends PropertyModel {

//   final int? numOfFloors;

//   final bool fireplace;

//   final bool hasBasement;

//   final double? basementArea;

//   final double? internalGarageArea;


//   VillaModel({

//     required super.id,
//     required super.requestId,
//     required super.clientId,
//     required super.referenceCode,
//     required super.zipCode,
//     required super.type,
//     required super.listingType,

//     super.simpleDescription,
//     super.fullDescription,

//     required super.location,
//     required super.city,

//     super.address,
//     super.latitude,
//     super.longitude,

//     super.rentalPeriod,

//     required super.listedPrice,

//     super.area,

//     required super.heating,

//     required super.furnishing,

//     required super.primaryPhoto,

//     required super.galleryPhotos,

//     required super.constructionYear,

//     required super.status,

//     required super.rooms,

//     required super.outdoorItems,

//     this.numOfFloors,

//     required this.fireplace,

//     required this.hasBasement,

//     this.basementArea,

//     this.internalGarageArea,

//   });


//   factory VillaModel.fromJson(
//       Map<String,dynamic> json){

//     return VillaModel(

//       id:json["id"],

//       requestId:json["request_id"],

//       clientId:json["client_id"],

//       referenceCode:json["reference_code"],

//       zipCode:json["zip_code"],

//       type:json["type"],

//       listingType:json["listing_type"],

//       simpleDescription:
//       json["simple_description"],

//       fullDescription:
//       json["full_description"],

//       location:json["location"],

//       city:json["city"],

//       address:json["address"],

//       latitude:
//       json["latitude"]?.toDouble(),

//       longitude:
//       json["longitude"]?.toDouble(),

//       rentalPeriod:
//       json["rental_period"],

//       listedPrice:
//       json["listed_price"]
//           .toDouble(),

//       area:json["area"],

//       heating:
//       json["heating"],

//       furnishing:
//       json["furnishing"],

//       primaryPhoto:
//       json["primary_photo"],

//       galleryPhotos:
//       List<String>.from(
//           json["gallery_photo"]??[]),

//       constructionYear:
//       json["construction_year"],

//       status:
//       json["status"],

//       rooms:
//       (json["roomItems"]??[])
//           .map<RoomItemModel>(
//               (e)=>
//               RoomItemModel
//                   .fromJson(e))
//           .toList(),

//       outdoorItems:
//       (json["outdoorItems"]??[])
//           .map<OutdoorItemModel>(
//               (e)=>
//               OutdoorItemModel
//                   .fromJson(e))
//           .toList(),

//       numOfFloors:
//       json["num_of_floors"],

//       fireplace:
//       json["fireplace"]
//           ??false,

//       hasBasement:
//       json["hasBasement"]
//           ??false,

//       basementArea:
//       json["basement_area"]
//           ?.toDouble(),

//       internalGarageArea:
//       json[
//       "internal_garage_area"]
//           ?.toDouble(),

//     );

//   }

// }
import 'dart:convert';
import 'package:estatelqapp/core/services/constants.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/property_model.dart';
import 'package:http/http.dart' as http;

class PropertyDetailsRemoteDataSource {
  final http.Client client;

  PropertyDetailsRemoteDataSource(this.client);

  Future<PropertyModel> getPropertyById(String id) async {
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/properties/$id"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);

      final data = jsonData['data'];

      if (data == null) {
        throw Exception("Property data is null");
      }

      return PropertyModel.fromJson(data);
    }

    throw Exception(
      "Failed to load property. Status code: ${response.statusCode}",
    );
  }
}
// import 'dart:async';

// import 'package:estatelqapp/features/property_details_feature/data/models/hall_model.dart';
// import 'package:estatelqapp/features/property_details_feature/data/models/house_model.dart';
// import 'package:estatelqapp/features/property_details_feature/data/models/store_model.dart';
// import 'package:estatelqapp/features/property_details_feature/data/models/villa_mode.dart';

// import '../models/appartment_model.dart';
// import '../models/outdoor_detail_model.dart';
// import '../models/property_model.dart';
// import '../models/room_model.dart';

// class PropertyDetailsRemoteDataSource {
//   Future<PropertyModel> getPropertyById(String id) async {
//     await Future.delayed(const Duration(seconds: 1));

//     if (id == "1") {
//       return ApartmentModel(
//         //-----------------------------
//         // main
//         //-----------------------------
//         id: "1",

//         // requestId: "REQ1001",

//         // clientId: "CLIENT22",

//         // referenceCode: "APT-001",
//         type: "Apartment",

//         // status: "Available",
//         listingType: "For Sale",

//         listedPrice: 165000,

//         simpleDescription: "Modern Apartment",

//         fullDescription:
//             "A clean and comfortable apartment with good space and natural light. Close to shops and transportation.",

//         //-----------------------------
//         // images
//         //-----------------------------
//         primaryPhoto: "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",

//         galleryPhotos: [
//           "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",

//           "assets/images/uday-vatti-8YC9T7W-lE4-unsplash.jpg",

//           "assets/images/tobias-wilden-4453DIQWtsQ-unsplash.jpg",

//           "assets/images/bogdan-vaskan-1taEJJwIv-0-unsplash.jpg",
//         ],

//         //-----------------------------
//         // location
//         //-----------------------------
//         location: "Al-Qadmous, Tartous, Syria",

//         // city: "Tartous",

//         // zipCode: "12345",
//         latitude: 34.7306,

//         longitude: 36.7089,

//         //-----------------------------
//         // apartment
//         //-----------------------------
//         floorNumber: 3,

//         elevator: true,

//         parking: "Available",

//         constructionYear: 2015,

//         heating: "Central Heating",

//         furnishing: "Semi Furnished",

//         //-----------------------------
//         // nearby
//         //-----------------------------
//         area: {
//           "University": true,

//           "School": true,

//           "Pharmacy": true,

//           "Restaurant": true,

//           "Supermarket": true,
//         },

//         //-----------------------------
//         // rooms
//         //-----------------------------
//         rooms: [
//           RoomItemModel(
//             id: "1",

//             type: "bedroom",

//             size: 20,

//             description: "Large bedroom with city view",

//             photos: [
//               "assets/images/ahmed-rangel-QAzk_ceFf-w-unsplash.jpg",

//               "assets/images/spacejoy-qGNgjHQjO2k-unsplash.jpg",

//               "assets/images/francesca-tosolini-hCU4fimRW-c-unsplash.jpg",

//               "assets/images/spacejoy-nEtpvJjnPVo-unsplash.jpg",
//             ],

//             hasBalcony: true,
//           ),

//           RoomItemModel(
//             id: "2",

//             type: "living",

//             size: 40,

//             description: "Large spacious living room",

//             photos: [
//               "assets/images/fairuz-naufal-zaki-DzCGADQSDxM-unsplash.jpg",

//               "assets/images/spacejoy-KJUGhE9ojro-unsplash.jpg",

//               "assets/images/lotus-design-n-print-0sDzRgrN_pI-unsplash.jpg",

//               "assets/images/lotus-design-n-print-0sDzRgrN_pI-unsplash.jpg",
//             ],

//             hasBalcony: false,
//           ),

//           RoomItemModel(
//             id: "3",

//             type: "bathroom",

//             size: 10,

//             description: "Modern Bathroom",

//             photos: [
//               "assets/images/steven-ungermann-1AF5hP6F4tI-unsplash.jpg",

//               "assets/images/lotus-design-n-print-g51F6-WYzyU-unsplash.jpg",
//             ],

//             hasBalcony: false,
//           ),

//           RoomItemModel(
//             id: "4",

//             type: "kitchen",

//             size: 30,

//             description: "Luxury kitchen with modern storage",

//             photos: [
//               "assets/images/lotus-design-n-print-oCw5_evbWyI-unsplash.jpg",

//               "assets/images/jason-briscoe-GliaHAJ3_5A-unsplash.jpg",
//             ],

//             hasBalcony: false,
//           ),
//         ],

//         //-----------------------------
//         // outdoor
//         //-----------------------------
//         outdoorItems: [
//           OutdoorItemModel(
//             id: "1",

//             type: "Parking",

//             description: "Covered parking for two cars",

//             photos: [
//               "assets/images/claudio-schwarz-fAmj2spOqxc-unsplash.jpg",

//               "assets/images/palo-kertys-aJGEVYOKE2Q-unsplash.jpg",
//             ],
//           ),

//           OutdoorItemModel(
//             id: "2",

//             type: "Garden",

//             description: "Large garden with terrace",

//             photos: [
//               "assets/images/egor-myznik-rCZQCbUAQvg-unsplash.jpg",

//               "assets/images/roberto-nickson-h1_ILkb9tLo-unsplash.jpg",
//             ],
//           ),

//           OutdoorItemModel(
//             id: "3",

//             type: "Swimming Pool",

//             description: "Small indoor swimming pool",

//             photos: [
//               "assets/images/thom-milkovic-vy_cVJCAVG0-unsplash.jpg",

//               "assets/images/jay-solomon-8lU54uEl8Ok-unsplash.jpg",
//             ],
//           ),
//         ],
//       );
//     }
//     if (id == "2") {
//       return VillaModel(
//         //-----------------------------
//         // main
//         //-----------------------------
//         id: "2",

//         type: "Villa",

//         listingType: "For Sale",

//         listedPrice: 450000,

//         simpleDescription: "Luxury Family Villa",

//         fullDescription:
//             "Luxury villa with multiple floors, fireplace, basement and a private garage. Spacious indoor and outdoor areas with modern design.",

//         //-----------------------------
//         // images
//         //-----------------------------
//         primaryPhoto: "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",

//         galleryPhotos: [
//           "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",

//           "assets/images/uday-vatti-8YC9T7W-lE4-unsplash.jpg",

//           "assets/images/tobias-wilden-4453DIQWtsQ-unsplash.jpg",

//           "assets/images/bogdan-vaskan-1taEJJwIv-0-unsplash.jpg",
//         ],

//         //-----------------------------
//         // location
//         //-----------------------------
//         location: "Damascus, Syria",

//         latitude: 33.5138,

//         longitude: 36.2765,

//         //-----------------------------
//         // villa
//         //-----------------------------
//         numOfFloors: 3,

//         fireplace: true,

//         hasBasement: true,

//         basementArea: 120,

//         internalGarageArea: 60,

//         constructionYear: 2020,

//         heating: "Central Heating",

//         furnishing: "Fully Furnished",

//         //-----------------------------
//         // nearby
//         //-----------------------------
//         area: {
//           "School": true,
//           "Restaurant": true,
//           "Hospital": true,
//           "Mall": true,
//         },

//         //-----------------------------
//         // rooms
//         //-----------------------------
//         rooms: [
//           RoomItemModel(
//             id: "1",

//             type: "bedroom",

//             size: 30,

//             description: "Master bedroom with balcony and city view",

//             photos: [
//               "assets/images/ahmed-rangel-QAzk_ceFf-w-unsplash.jpg",

//               "assets/images/spacejoy-qGNgjHQjO2k-unsplash.jpg",

//               "assets/images/francesca-tosolini-hCU4fimRW-c-unsplash.jpg",
//             ],

//             hasBalcony: true,
//           ),

//           RoomItemModel(
//             id: "2",

//             type: "living",

//             size: 70,

//             description: "Very large family living room",

//             photos: [
//               "assets/images/fairuz-naufal-zaki-DzCGADQSDxM-unsplash.jpg",

//               "assets/images/spacejoy-KJUGhE9ojro-unsplash.jpg",
//             ],

//             hasBalcony: false,
//           ),

//           RoomItemModel(
//             id: "3",

//             type: "kitchen",

//             size: 35,

//             description: "Modern kitchen with luxury finishing",

//             photos: [
//               "assets/images/lotus-design-n-print-oCw5_evbWyI-unsplash.jpg",

//               "assets/images/jason-briscoe-GliaHAJ3_5A-unsplash.jpg",
//             ],

//             hasBalcony: false,
//           ),

//           RoomItemModel(
//             id: "4",

//             type: "bathroom",

//             size: 15,

//             description: "Luxury bathroom with modern design",

//             photos: ["assets/images/steven-ungermann-1AF5hP6F4tI-unsplash.jpg"],

//             hasBalcony: false,
//           ),
//         ],

//         //-----------------------------
//         // outdoor
//         //-----------------------------
//         outdoorItems: [
//           OutdoorItemModel(
//             id: "1",

//             type: "Garden",

//             description: "Large outdoor garden area",

//             photos: [
//               "assets/images/egor-myznik-rCZQCbUAQvg-unsplash.jpg",

//               "assets/images/roberto-nickson-h1_ILkb9tLo-unsplash.jpg",
//             ],
//           ),

//           OutdoorItemModel(
//             id: "2",

//             type: "Pool",

//             description: "Private swimming pool",

//             photos: ["assets/images/thom-milkovic-vy_cVJCAVG0-unsplash.jpg"],
//           ),

//           OutdoorItemModel(
//             id: "3",

//             type: "Garage",

//             description: "Indoor garage for multiple cars",

//             photos: ["assets/images/claudio-schwarz-fAmj2spOqxc-unsplash.jpg"],
//           ),
//         ],
//       );
//     }

//     if (id == "3") {
//       return HouseModel(
//         //-----------------------------
//         // main
//         //-----------------------------
//         id: "3",

//         type: "House",

//         listingType: "For Sale",

//         listedPrice: 450000,

//         simpleDescription: "Luxury Family House",

//         fullDescription:
//             "Luxury House with multiple floors, fireplace, basement and a private garage. Spacious indoor and outdoor areas with modern design.",

//         //-----------------------------
//         // images
//         //-----------------------------
//         primaryPhoto: "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",

//         galleryPhotos: [
//           "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",

//           "assets/images/uday-vatti-8YC9T7W-lE4-unsplash.jpg",

//           "assets/images/tobias-wilden-4453DIQWtsQ-unsplash.jpg",

//           "assets/images/bogdan-vaskan-1taEJJwIv-0-unsplash.jpg",
//         ],

//         //-----------------------------
//         // location
//         //-----------------------------
//         location: "Damascus, Syria",

//         latitude: 33.5138,

//         longitude: 36.2765,

//         //-----------------------------
//         // villa
//         //-----------------------------
//         numOfFloors: 3,

//         fireplace: true,

//         hasBasement: true,

//         basementArea: 120,

//         internalGarageArea: 60,

//         constructionYear: 2020,

//         heating: "Central Heating",

//         furnishing: "Fully Furnished",

//         //-----------------------------
//         // nearby
//         //-----------------------------
//         area: {
//           "School": true,
//           "Restaurant": true,
//           "Hospital": true,
//           "Mall": true,
//         },

//         //-----------------------------
//         // rooms
//         //-----------------------------
//         rooms: [
//           RoomItemModel(
//             id: "1",

//             type: "bedroom",

//             size: 30,

//             description: "Master bedroom with balcony and city view",

//             photos: [
//               "assets/images/ahmed-rangel-QAzk_ceFf-w-unsplash.jpg",

//               "assets/images/spacejoy-qGNgjHQjO2k-unsplash.jpg",

//               "assets/images/francesca-tosolini-hCU4fimRW-c-unsplash.jpg",
//             ],

//             hasBalcony: true,
//           ),

//           RoomItemModel(
//             id: "2",

//             type: "living",

//             size: 70,

//             description: "Very large family living room",

//             photos: [
//               "assets/images/fairuz-naufal-zaki-DzCGADQSDxM-unsplash.jpg",

//               "assets/images/spacejoy-KJUGhE9ojro-unsplash.jpg",
//             ],

//             hasBalcony: false,
//           ),

//           RoomItemModel(
//             id: "3",

//             type: "kitchen",

//             size: 35,

//             description: "Modern kitchen with luxury finishing",

//             photos: [
//               "assets/images/lotus-design-n-print-oCw5_evbWyI-unsplash.jpg",

//               "assets/images/jason-briscoe-GliaHAJ3_5A-unsplash.jpg",
//             ],

//             hasBalcony: false,
//           ),

//           RoomItemModel(
//             id: "4",

//             type: "bathroom",

//             size: 15,

//             description: "Luxury bathroom with modern design",

//             photos: ["assets/images/steven-ungermann-1AF5hP6F4tI-unsplash.jpg"],

//             hasBalcony: false,
//           ),
//         ],

//         //-----------------------------
//         // outdoor
//         //-----------------------------
//         outdoorItems: [
//           OutdoorItemModel(
//             id: "1",

//             type: "Garden",

//             description: "Large outdoor garden area",

//             photos: [
//               "assets/images/egor-myznik-rCZQCbUAQvg-unsplash.jpg",

//               "assets/images/roberto-nickson-h1_ILkb9tLo-unsplash.jpg",
//             ],
//           ),

//           OutdoorItemModel(
//             id: "2",

//             type: "Pool",

//             description: "Private swimming pool",

//             photos: ["assets/images/thom-milkovic-vy_cVJCAVG0-unsplash.jpg"],
//           ),

//           OutdoorItemModel(
//             id: "3",

//             type: "Garage",

//             description: "Indoor garage for multiple cars",

//             photos: ["assets/images/claudio-schwarz-fAmj2spOqxc-unsplash.jpg"],
//           ),
//         ],
//       );
//     }
//     if (id == "4") {
//       return HallModel(
//         //-----------------------------
//         // main
//         //-----------------------------
//         id: "4",

//         type: "Hall",

//         listingType: "For Rent",

//         listedPrice: 2500,

//         simpleDescription: "Luxury Event Hall",

//         fullDescription:
//             "Large event hall suitable for weddings, conferences and celebrations with spacious seating areas and premium facilities.",

//         //-----------------------------
//         // images
//         //-----------------------------
//         primaryPhoto: "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",

//         galleryPhotos: [
//           "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",

//           "assets/images/uday-vatti-8YC9T7W-lE4-unsplash.jpg",

//           "assets/images/tobias-wilden-4453DIQWtsQ-unsplash.jpg",

//           "assets/images/bogdan-vaskan-1taEJJwIv-0-unsplash.jpg",
//         ],

//         //-----------------------------
//         // location
//         //-----------------------------
//         location: "Damascus, Syria",

//         latitude: 33.5138,

//         longitude: 36.2765,

//         //-----------------------------
//         // hall
//         //-----------------------------
//         floorNumber: 2,

//         elevator: true,

//         parking: "Large Parking Available",

//         constructionYear: 2022,

//         heating: "Central Heating",

//         furnishing: "Fully Furnished",

//         //-----------------------------
//         // nearby
//         //-----------------------------
//         area: {
//           "Hotel": true,

//           "Restaurant": true,

//           "Parking": true,

//           "Mall": true,

//           "Cafe": true,
//         },

//         //-----------------------------
//         // rooms
//         //-----------------------------
//         rooms: [
//           RoomItemModel(
//             id: "1",

//             type: "MAIN_HALL",

//             size: 300,

//             description: "Large main hall for weddings and events",

//             photos: [
//               "assets/images/ahmed-rangel-QAzk_ceFf-w-unsplash.jpg",

//               "assets/images/spacejoy-qGNgjHQjO2k-unsplash.jpg",

//               "assets/images/francesca-tosolini-hCU4fimRW-c-unsplash.jpg",
//             ],

//             hasBalcony: false,
//           ),

//           RoomItemModel(
//             id: "2",

//             type: "VIP_ROOM",

//             size: 50,

//             description: "Luxury VIP room for guests",

//             photos: [
//               "assets/images/fairuz-naufal-zaki-DzCGADQSDxM-unsplash.jpg",

//               "assets/images/spacejoy-KJUGhE9ojro-unsplash.jpg",
//             ],

//             hasBalcony: false,
//           ),

//           RoomItemModel(
//             id: "3",

//             type: "STAGE",

//             size: 70,

//             description: "Large stage with lighting system",

//             photos: [
//               "assets/images/lotus-design-n-print-oCw5_evbWyI-unsplash.jpg",

//               "assets/images/jason-briscoe-GliaHAJ3_5A-unsplash.jpg",
//             ],

//             hasBalcony: false,
//           ),
//         ],

//         //-----------------------------
//         // outdoor
//         //-----------------------------
//         outdoorItems: [
//           OutdoorItemModel(
//             id: "1",

//             type: "Parking",

//             description: "Large parking area for visitors",

//             photos: ["assets/images/claudio-schwarz-fAmj2spOqxc-unsplash.jpg"],
//           ),

//           OutdoorItemModel(
//             id: "2",

//             type: "Outdoor Seating",

//             description: "Outdoor seating and garden area",

//             photos: [
//               "assets/images/egor-myznik-rCZQCbUAQvg-unsplash.jpg",

//               "assets/images/roberto-nickson-h1_ILkb9tLo-unsplash.jpg",
//             ],
//           ),

//           OutdoorItemModel(
//             id: "3",

//             type: "Swimming Pool",

//             description: "Luxury pool beside the hall",

//             photos: ["assets/images/thom-milkovic-vy_cVJCAVG0-unsplash.jpg"],
//           ),
//         ],
//       );
//     }
//     if (id == "5") {
//       return StoreModel(
//         id: "5",

//         type: "Store",

//         listingType: "For Rent",

//         listedPrice: 1200,

//         simpleDescription: "Commercial Store",

//         fullDescription:
//             "Spacious commercial store located in a busy area suitable for all types of businesses.",

//         primaryPhoto: "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",

//         galleryPhotos: [
//           "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",
//           "assets/images/uday-vatti-8YC9T7W-lE4-unsplash.jpg",
//         ],

//         location: "Damascus - Midan",

//         latitude: 33.51,

//         longitude: 36.27,

//         floorNumber: 1,

//         parking: "Street Parking",

//         constructionYear: 2018,

//         heating: "None",

//         furnishing: "Unfurnished",

//         area: {"High Traffic": true, "Near Market": true},

//         rooms: [],
//         outdoorItems: [],
//       );
//     }

//     throw Exception("Property not found");
//   }
// }

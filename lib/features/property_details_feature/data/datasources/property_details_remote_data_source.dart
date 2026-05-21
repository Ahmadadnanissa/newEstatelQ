// import 'dart:convert';

// import 'package:estatelqapp/features/property_details_feature/data/models/property_factory_model.dart';
// import 'package:estatelqapp/features/property_details_feature/data/models/property_model.dart';
// import 'package:http/http.dart' as http;

// class PropertyDetailsRemoteDataSource {
//   final http.Client client;

//   PropertyDetailsRemoteDataSource(this.client);

//   Future<PropertyModel> getPropertyById(String id) async {
//     final response = await client.get(
//       Uri.parse("YOUR_URL/properties/$id"),

//       headers: {'Content-Type': 'application/json'},
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);

//       return PropertyFactory.fromJson(data["data"]);
//     }

//     throw Exception("Failed To Load Property");
//   }
// }
import 'dart:async';

import '../models/appartment_model.dart';
import '../models/outdoor_detail_model.dart';
import '../models/property_model.dart';
import '../models/room_model.dart';

class PropertyDetailsRemoteDataSource {
  Future<PropertyModel> getPropertyById(String id) async {
    await Future.delayed(const Duration(seconds: 1));

    if (id == "1") {
      return ApartmentModel(
        //-----------------------------
        // main
        //-----------------------------
        id: "1",

        requestId: "REQ1001",

        clientId: "CLIENT22",

        referenceCode: "APT-001",

        type: "Apartment",

        status: "Available",

        listingType: "For Sale",

        listedPrice: 165000,

        simpleDescription: "Modern Apartment",

        fullDescription:
            "A clean and comfortable apartment with good space and natural light. Close to shops and transportation.",

        //-----------------------------
        // images
        //-----------------------------
        primaryPhoto: "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",

        galleryPhotos: [
          "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",

          "assets/images/uday-vatti-8YC9T7W-lE4-unsplash.jpg",

          "assets/images/tobias-wilden-4453DIQWtsQ-unsplash.jpg",

          "assets/images/bogdan-vaskan-1taEJJwIv-0-unsplash.jpg",
        ],

        //-----------------------------
        // location
        //-----------------------------
        location: "Al-Qadmous, Tartous, Syria",

        city: "Tartous",

        zipCode: "12345",

        latitude: 34.7306,

        longitude: 36.7089,

        //-----------------------------
        // apartment
        //-----------------------------
        floorNumber: 3,

        elevator: true,

        parking: "Available",

        constructionYear: 2015,

        heating: "Central Heating",

        furnishing: "Semi Furnished",

        //-----------------------------
        // nearby
        //-----------------------------
        area: {
          "University": true,

          "School": true,

          "Pharmacy": true,

          "Restaurant": true,

          "Supermarket": true,
        },

        //-----------------------------
        // rooms
        //-----------------------------
        rooms: [
          RoomItemModel(
            id: "1",

            type: "bedroom",

            size: 20,

            description: "Large bedroom with city view",

            photos: [
              "assets/images/ahmed-rangel-QAzk_ceFf-w-unsplash.jpg",

              "assets/images/spacejoy-qGNgjHQjO2k-unsplash.jpg",

              "assets/images/francesca-tosolini-hCU4fimRW-c-unsplash.jpg",

              "assets/images/spacejoy-nEtpvJjnPVo-unsplash.jpg",
            ],

            hasBalcony: true,
          ),

          RoomItemModel(
            id: "2",

            type: "living",

            size: 40,

            description: "Large spacious living room",

            photos: [
              "assets/images/fairuz-naufal-zaki-DzCGADQSDxM-unsplash.jpg",

              "assets/images/spacejoy-KJUGhE9ojro-unsplash.jpg",

              "assets/images/lotus-design-n-print-0sDzRgrN_pI-unsplash.jpg",

              "assets/images/lotus-design-n-print-0sDzRgrN_pI-unsplash.jpg",
            ],

            hasBalcony: false,
          ),

          RoomItemModel(
            id: "3",

            type: "bathroom",

            size: 10,

            description: "Modern Bathroom",

            photos: [
              "assets/images/steven-ungermann-1AF5hP6F4tI-unsplash.jpg",

              "assets/images/lotus-design-n-print-g51F6-WYzyU-unsplash.jpg",
            ],

            hasBalcony: false,
          ),

          RoomItemModel(
            id: "4",

            type: "kitchen",

            size: 30,

            description: "Luxury kitchen with modern storage",

            photos: [
              "assets/images/lotus-design-n-print-oCw5_evbWyI-unsplash.jpg",

              "assets/images/jason-briscoe-GliaHAJ3_5A-unsplash.jpg",
            ],

            hasBalcony: false,
          ),
        ],

        //-----------------------------
        // outdoor
        //-----------------------------
        outdoorItems: [
          OutdoorItemModel(
            id: "1",

            type: "Parking",

            description: "Covered parking for two cars",

            photos: [
              "assets/images/claudio-schwarz-fAmj2spOqxc-unsplash.jpg",

              "assets/images/palo-kertys-aJGEVYOKE2Q-unsplash.jpg",
            ],
          ),

          OutdoorItemModel(
            id: "2",

            type: "Garden",

            description: "Large garden with terrace",

            photos: [
              "assets/images/egor-myznik-rCZQCbUAQvg-unsplash.jpg",

              "assets/images/roberto-nickson-h1_ILkb9tLo-unsplash.jpg",
            ],
          ),

          OutdoorItemModel(
            id: "3",

            type: "Swimming Pool",

            description: "Small indoor swimming pool",

            photos: [
              "assets/images/thom-milkovic-vy_cVJCAVG0-unsplash.jpg",

              "assets/images/jay-solomon-8lU54uEl8Ok-unsplash.jpg",
            ],
          ),
        ],
      );
    }

    throw Exception("Property not found");
  }
}

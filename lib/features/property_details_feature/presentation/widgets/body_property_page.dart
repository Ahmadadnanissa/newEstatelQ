import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/outdoor_detail_model.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/property_model.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/room_model.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/pages/property_on_map_page.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/bed_and_bath_and_sqft.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_nearby_widget.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_widget_for_more_details.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/details_of_description.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/property_image.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/sum_details_for_property_like_title.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/type_button_reviews_widget.dart';
import 'package:flutter/material.dart';

class BodyPropertyPage extends StatelessWidget {
  BodyPropertyPage({super.key});

  final PropertyModel property = PropertyModel(
    id: '1',
    title: 'Mountain View Villa',
    address: 'Al-Qadmous, Tartous, Syria',
    type: 'Apartments',
    rentOrSale: 'for sale',
    price: 165000,

    rating: 10.0,
    reviewCount: 200,

    description:
        'A clean and comfortable apartment with good space and natural light. Close to shops and public transportation.',

    primaryImage: 'assets/images/jesse-collins-LUitWpwc008-unsplash.jpg',

    galleryImages: [
      'assets/images/jesse-collins-LUitWpwc008-unsplash.jpg',
      'assets/images/uday-vatti-8YC9T7W-lE4-unsplash.jpg',
      'assets/images/tobias-wilden-4453DIQWtsQ-unsplash.jpg',
      'assets/images/bogdan-vaskan-1taEJJwIv-0-unsplash.jpg',
    ],

    rooms: [
      Room(
        id: '1',
        name: 'Bed Room',
        type: 'bedroom',
        description:
            'The home features two rooms—one bedroom and one living room—both offering views of the city. The bedroom measures 20 square meters.',
        images: [
          'assets/images/ahmed-rangel-QAzk_ceFf-w-unsplash.jpg',
          'assets/images/spacejoy-qGNgjHQjO2k-unsplash.jpg',
          'assets/images/francesca-tosolini-hCU4fimRW-c-unsplash.jpg',
          'assets/images/spacejoy-nEtpvJjnPVo-unsplash.jpg',
        ],
      ),

      Room(
        id: '2',
        name: 'Living Room',
        type: 'living',
        description:
            "The living room is large and spacious, with excellent lighting and new, elegant furnishings.",
        images: [
          'assets/images/fairuz-naufal-zaki-DzCGADQSDxM-unsplash.jpg',
          'assets/images/spacejoy-KJUGhE9ojro-unsplash.jpg',
          'assets/images/lotus-design-n-print-0sDzRgrN_pI-unsplash.jpg',
          'assets/images/lotus-design-n-print-0sDzRgrN_pI-unsplash.jpg',
        ],
      ),

      Room(
        id: '3',
        name: 'Bathroom 1',
        type: 'bathroom',
        description:
            'We have two bathrooms that have been well-tiled and decorated, each featuring a bathtub.',
        images: [
          'assets/images/steven-ungermann-1AF5hP6F4tI-unsplash.jpg',
          'assets/images/lotus-design-n-print-g51F6-WYzyU-unsplash.jpg',
          'assets/images/backbone-L4iRkKL5dng-unsplash.jpg',
          'assets/images/phil-hearing-U7PitHRnTNU-unsplash.jpg',
        ],
      ),

      Room(
        id: '4',
        name: 'Kitchen',
        type: 'kitchen',
        description:
            'We have a large kitchen with high-quality wooden storage and modern appliances.',
        images: [
          'assets/images/lotus-design-n-print-oCw5_evbWyI-unsplash.jpg',
          'assets/images/jason-briscoe-GliaHAJ3_5A-unsplash.jpg',
          'assets/images/naomi-hebert-MP0bgaS_d1c-unsplash.jpg',
          'assets/images/collov-home-design--aDGbdTsBZg-unsplash.jpg',
        ],
      ),
    ],

    outdoorDetails: [
      OutdoorDetail(
        title: 'Parking',
        description:
            'We have a 20-meter covered parking space that can accommodate two cars.',
        value: 'Available',
        images: [
          'assets/images/claudio-schwarz-fAmj2spOqxc-unsplash.jpg',
          'assets/images/palo-kertys-aJGEVYOKE2Q-unsplash.jpg',
          'assets/images/michael-fousert-CrU3lUW2jRk-unsplash.jpg',
          'assets/images/egor-myznik-rCZQCbUAQvg-unsplash.jpg',
        ],
      ),
      OutdoorDetail(
        title: 'Garden',
        description:
            'We have a 20-meter covered parking space that can accommodate two cars.',
        value: 'Yes(Garden,Terrace)',
        images: [
          'assets/images/claudio-schwarz-fAmj2spOqxc-unsplash.jpg',
          'assets/images/palo-kertys-aJGEVYOKE2Q-unsplash.jpg',
          'assets/images/michael-fousert-CrU3lUW2jRk-unsplash.jpg',
          'assets/images/egor-myznik-rCZQCbUAQvg-unsplash.jpg',
        ],
      ),
      OutdoorDetail(
        title: 'swimming pool',
        description:
            'There is a small, covered swimming pool measuring 10 meters.',
        value: 'Available',
        images: [
          'assets/images/roberto-nickson-h1_ILkb9tLo-unsplash.jpg',
          'assets/images/thom-milkovic-vy_cVJCAVG0-unsplash.jpg',
          'assets/images/jay-solomon-8lU54uEl8Ok-unsplash.jpg',
          'assets/images/john-fornander-y3_AHHrxUBY-unsplash.jpg',
        ],
      ),
    ],

    latitude: 34.7306,
    longitude: 36.7089,

    nearbyPlaces: [
      'University',
      'School',
      'Pharmacy',
      'Restaurant',
      'Supermarket',
    ],

    areaDetail: OutdoorDetail(
      title: '2000 sqft',
      description:
          'The net area of ​​the property is 150 square meters, with an external garden measuring 50 square meters; thus, the total area of ​​the property—including the garden—is 200 square meters.',
      value: 'More Info',
      images: [
        'assets/images/amsterdam-city-archives-IIyMRyOGyag-unsplash.jpg',
        'assets/images/claudio-schwarz-9Egaj7L5cJM-unsplash.jpg',
        'assets/images/amsterdam-city-archives--StEPF2CK2M-unsplash.jpg',
        'assets/images/th-nh-l-u-S3cF3QeZ7Zs-unsplash.jpg',
      ],
    ),

    extraDetails: [
      'Year Built: 2015',
      'Floor number is 3',
      'There is an elevator',
    ],
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PropertyImage(primaryImage: property.primaryImage),
            SumDetailsForPropertyLikeTitle(
              subDescription: property.title,
              address: property.address,
              rentOrSale: property.rentOrSale,
              price: property.price.toString(),
            ),
            TypeButtonReviewsWidget(
              propertyType: property.type,
              reviewCount: '${property.reviewCount.toString()} review',
              rating: property.rating.toString(),
            ),
            DetailsOfDescription(
              fullDescr: property.description,
              image1: property.galleryImages[0],
              image2: property.galleryImages[1],
              image3: property.galleryImages[2],
              image4: property.galleryImages[3],
            ),
            SizedBox(height: width * 0.04),
            Divider(color: Colors.grey.shade300, thickness: 1, height: 20),
            SizedBox(height: width * 0.02),
            BedAndBathAndSqft(rooms: property.rooms),
            SizedBox(height: width * 0.04),
            Divider(color: Colors.grey.shade300, thickness: 1, height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFont(
                    name: 'Outdoor Details',
                    fontColor: blackColor,
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: width * 0.04),
                  ListView.builder(
                    itemCount: property.outdoorDetails.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CustomWidgetForOutdoorPlaces(
                        outDoor: property.outdoorDetails[index],
                      );
                    },
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          name: 'Location',
                          fontColor: blackColor,
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: width * 0.04),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  SlideRight(
                                    page: PropertyOnMap(
                                      propertyLat: property.latitude,
                                      propertyLng: property.longitude,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: width * 0.4,
                                height: width * 0.25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    width * 0.04,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    width * 0.04,
                                  ),
                                  child: Image.asset(
                                    'assets/images/map_Image.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.02),
                            SizedBox(
                              width: width * 0.45,
                              child: Text(
                                property.address,
                                style: TextStyle(
                                  color: Color(0xff5F6264),
                                  fontSize: width * 0.04,
                                  fontFamily: fontFamily,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: width * 0.02),
                        CustomFont(
                          name: 'Nearby Places',
                          fontColor: blackColor,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: width * 0.02),

                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: property.nearbyPlaces.map((place) {
                            return CustomNearbyWidget(name: place);
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: width * 0.04),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                    height: 20,
                  ),
                  SizedBox(height: width * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          name: 'More Details',
                          fontColor: blackColor,
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w600,
                        ),

                        CustomWidgetForOutdoorPlaces(
                          outDoor: property.areaDetail,
                        ),
                        SizedBox(height: width * 0.04),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: property.extraDetails.map((e) {
                            return CustomNearbyWidget(name: e);
                          }).toList(),
                        ),
                        SizedBox(height: width * 0.06),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

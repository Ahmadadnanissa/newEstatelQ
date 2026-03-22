import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/bed_and_bath_and_sqft.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_nearby_widget.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_widget_for_more_details.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/details_of_description.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/property_image.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/sum_details_for_property_like_title.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/type_button_reviews_widget.dart';
import 'package:flutter/material.dart';

class BodyPropertyPage extends StatelessWidget {
  const BodyPropertyPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PropertyImage(),
          SumDetailsForPropertyLikeTitle(),
          TypeButtonReviewsWidget(),
          DetailsOfDescription(),
          SizedBox(height: width * 0.04),
          Divider(color: Colors.grey.shade300, thickness: 1, height: 20),
          SizedBox(height: width * 0.02),
          BedAndBathAndSqft(),
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
                CustomWidgetForMoreDetails(
                  whichDetail: 'Parking',
                  value: 'Available',
                  description:
                      'We have a 20-meter covered parking space that can accommodate two cars.',
                  image1:
                      'assets/images/claudio-schwarz-fAmj2spOqxc-unsplash.jpg',
                  image2: 'assets/images/palo-kertys-aJGEVYOKE2Q-unsplash.jpg',
                  image3:
                      'assets/images/michael-fousert-CrU3lUW2jRk-unsplash.jpg',
                  image4: 'assets/images/egor-myznik-rCZQCbUAQvg-unsplash.jpg',
                ),
                CustomWidgetForMoreDetails(
                  whichDetail: 'Garden',
                  value: 'Yes(Garden,Terrace)',
                  description:
                      'The house has a 30-meter garden surrounding it, containing several fruit trees, a decorative terrace, and a fountain.',
                  image1:
                      'assets/images/paul-pastourmatzis-PjpuXmX7DAA-unsplash.jpg',
                  image2: 'assets/images/aaron-burden-b9drVB7xIOI-unsplash.jpg',
                  image3:
                      'assets/images/miguel-ibanez-cO7zI0lqzqI-unsplash.jpg',
                  image4:
                      'assets/images/matthew-smith-rFBA42UFpLs-unsplash.jpg',
                ),

                // CustomWidgetForMoreDetails(
                //   whichDetail: 'Heating',
                //   value: 'Available',
                //   description:
                //       'The entire house has central heating in addition to a fireplace.',
                //   image1: 'assets/images/immo-wegmann-2nsQWyPU6tw-unsplash.jpg',
                //   image2: 'assets/images/alfonso-escu-_wcXtm0iKJU-unsplash.jpg',
                //   image3: 'assets/images/immo-wegmann-7cNw5DZAVkc-unsplash.jpg',
                //   image4: 'assets/images/clay-banks-79yk4XalXCM-unsplash.jpg',
                // ),
                CustomWidgetForMoreDetails(
                  whichDetail: 'swimming pool',
                  value: 'Available',
                  description:
                      'There is a small, covered swimming pool measuring 10 meters.',
                  image1:
                      'assets/images/roberto-nickson-h1_ILkb9tLo-unsplash.jpg',
                  image2:
                      'assets/images/thom-milkovic-vy_cVJCAVG0-unsplash.jpg',
                  image3: 'assets/images/jay-solomon-8lU54uEl8Ok-unsplash.jpg',
                  image4:
                      'assets/images/john-fornander-y3_AHHrxUBY-unsplash.jpg',
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey.shade300, thickness: 1, height: 20),
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
                    Container(
                      width: width * 0.4,
                      height: width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.04),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(width * 0.04),
                        child: Image.asset(
                          'assets/images/map_Image.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    SizedBox(
                      width: width * 0.45,
                      child: Text(
                        'Al-Qadmous, Tartous, Syria',
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
                  children: [
                    CustomNearbyWidget(name: 'University'),
                    CustomNearbyWidget(name: 'School'),
                    CustomNearbyWidget(name: 'Pharmacy'),
                    CustomNearbyWidget(name: 'Supermarket'),
                    CustomNearbyWidget(name: 'Restaurant'),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: width * 0.04),
          Divider(color: Colors.grey.shade300, thickness: 1, height: 20),
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
                CustomWidgetForMoreDetails(
                  whichDetail: 'Heating',
                  value: 'Available',
                  description:
                      'The entire house has central heating in addition to a fireplace.',
                  image1: 'assets/images/immo-wegmann-2nsQWyPU6tw-unsplash.jpg',
                  image2: 'assets/images/alfonso-escu-_wcXtm0iKJU-unsplash.jpg',
                  image3: 'assets/images/immo-wegmann-7cNw5DZAVkc-unsplash.jpg',
                  image4: 'assets/images/clay-banks-79yk4XalXCM-unsplash.jpg',
                ),
                CustomWidgetForMoreDetails(
                  whichDetail: '2000 sqft',
                  value: 'More Info',
                  description:
                      'The net area of ​​the property is 150 square meters, with an external garden measuring 50 square meters; thus, the total area of ​​the property—including the garden—is 200 square meters.',
                  image1:
                      'assets/images/amsterdam-city-archives-IIyMRyOGyag-unsplash.jpg',
                  image2:
                      'assets/images/claudio-schwarz-9Egaj7L5cJM-unsplash.jpg',
                  image3:
                      'assets/images/amsterdam-city-archives--StEPF2CK2M-unsplash.jpg',
                  image4: 'assets/images/th-nh-l-u-S3cF3QeZ7Zs-unsplash.jpg',
                ),
                SizedBox(height: width * 0.04),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    CustomNearbyWidget(name: 'Year Built: 2015'),
                    CustomNearbyWidget(name: 'Floor number is 3'),
                    CustomNearbyWidget(name: 'There is an elevator'),
                  ],
                ),
                SizedBox(height: width * 0.06),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

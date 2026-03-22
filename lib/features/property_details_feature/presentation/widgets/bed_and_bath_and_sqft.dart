import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/details_about_bath.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/details_about_beds.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BedAndBathAndSqft extends StatefulWidget {
  const BedAndBathAndSqft({super.key});

  @override
  State<BedAndBathAndSqft> createState() => _BedAndBathAndSqftState();
}

class _BedAndBathAndSqftState extends State<BedAndBathAndSqft> {
  String isSelected = 'livingRoom';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      focusColor: primaryColor,
                      hoverColor: primaryColor,
                      splashColor: primaryColor,
                      highlightColor: primaryColor,

                      onTap: () {
                        isSelected = 'livingRoom';
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.living_outlined,
                            color: secondaryColor,
                            size: width * 0.06,
                          ),
                          SizedBox(width: width * 0.01),
                          CustomFont(
                            name: 'Living Room',
                            fontColor: blackColor,
                            fontSize: width * 0.04,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: isSelected == 'livingRoom'
                          ? width * 0.02
                          : width * 0.01,
                    ),
                    Container(
                      width: width * 0.18,
                      height: width * 0.0009,
                      color: isSelected == 'livingRoom'
                          ? secondaryColor
                          : primaryColor,
                    ),
                    SizedBox(height: width * 0.02),
                  ],
                ),
                SizedBox(width: width * 0.1),
                Column(
                  children: [
                    InkWell(
                      focusColor: primaryColor,
                      hoverColor: primaryColor,
                      splashColor: primaryColor,
                      highlightColor: primaryColor,

                      onTap: () {
                        isSelected = 'bedRoom';
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.bed,
                            color: secondaryColor,
                            size: width * 0.06,
                          ),
                          SizedBox(width: width * 0.01),
                          CustomFont(
                            name: 'Bed Room',
                            fontColor: blackColor,
                            fontSize: width * 0.04,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: isSelected == 'bedRoom'
                          ? width * 0.02
                          : width * 0.01,
                    ),
                    Container(
                      width: width * 0.18,
                      height: width * 0.0009,
                      color: isSelected == 'bedRoom'
                          ? secondaryColor
                          : primaryColor,
                    ),
                    SizedBox(height: width * 0.02),
                  ],
                ),
                SizedBox(width: width * 0.1),
                Column(
                  children: [
                    InkWell(
                      focusColor: primaryColor,
                      hoverColor: primaryColor,
                      splashColor: primaryColor,
                      highlightColor: primaryColor,

                      onTap: () {
                        isSelected = 'kitchen';
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.kitchen,
                            color: secondaryColor,
                            size: width * 0.06,
                          ),
                          SizedBox(width: width * 0.01),
                          CustomFont(
                            name: 'Kitchen',
                            fontColor: blackColor,
                            fontSize: width * 0.04,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: isSelected == 'kitchen'
                          ? width * 0.02
                          : width * 0.01,
                    ),
                    Container(
                      width: width * 0.18,
                      height: width * 0.0009,
                      color: isSelected == 'kitchen'
                          ? secondaryColor
                          : primaryColor,
                    ),
                    SizedBox(height: width * 0.02),
                  ],
                ),
                SizedBox(width: width * 0.1),
                Column(
                  children: [
                    InkWell(
                      focusColor: primaryColor,
                      hoverColor: primaryColor,
                      splashColor: primaryColor,
                      highlightColor: primaryColor,
                      onTap: () {
                        isSelected = 'path';
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.bathroom,
                            color: secondaryColor,
                            size: width * 0.06,
                          ),
                          SizedBox(width: width * 0.01),
                          CustomFont(
                            name: '2 path',
                            fontColor: blackColor,
                            fontSize: width * 0.04,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: isSelected == 'path'
                          ? width * 0.02
                          : width * 0.01,
                    ),
                    Container(
                      width: width * 0.18,
                      height: width * 0.0009,
                      color: isSelected == 'path'
                          ? secondaryColor
                          : primaryColor,
                    ),
                    SizedBox(height: width * 0.02),
                  ],
                ),
                SizedBox(width: width * 0.03),
              ],
            ),
          ),
          isSelected == 'bedRoom'
              ? DetailsAboutBeds(
                  descr:
                      'The home features two rooms—one bedroom and one living room—both offering views of the city. The bedroom measures 20 square meters, while the other room measures 30 square meters.',
                  image1: 'assets/images/ahmed-rangel-QAzk_ceFf-w-unsplash.jpg',
                  image2: 'assets/images/spacejoy-qGNgjHQjO2k-unsplash.jpg',
                  image3:
                      'assets/images/francesca-tosolini-hCU4fimRW-c-unsplash.jpg',
                  image4: 'assets/images/spacejoy-nEtpvJjnPVo-unsplash.jpg',
                )
              : isSelected == 'livingRoom'
              ? DetailsAboutBeds(
                  descr:
                      "The living room is large and spacious, with excellent lighting and new, elegant furnishings.",
                  image1:
                      'assets/images/fairuz-naufal-zaki-DzCGADQSDxM-unsplash.jpg',
                  image2: 'assets/images/spacejoy-KJUGhE9ojro-unsplash.jpg',
                  image3:
                      'assets/images/lotus-design-n-print-0sDzRgrN_pI-unsplash.jpg',
                  image4:
                      'assets/images/lotus-design-n-print-0sDzRgrN_pI-unsplash.jpg',
                )
              : isSelected == 'path'
              ? DetailsAboutBath()
              : DetailsAboutBeds(
                  descr:
                      'We have a large bathroom vanity with high-quality wooden storage, a refrigerator, a washing machine, and Spanish ceramic tiles with various decorative elements.',
                  image1:
                      'assets/images/lotus-design-n-print-oCw5_evbWyI-unsplash.jpg',
                  image2:
                      'assets/images/jason-briscoe-GliaHAJ3_5A-unsplash.jpg',
                  image3: 'assets/images/naomi-hebert-MP0bgaS_d1c-unsplash.jpg',
                  image4:
                      'assets/images/collov-home-design--aDGbdTsBZg-unsplash.jpg',
                ),
        ],
      ),
    );
  }
}

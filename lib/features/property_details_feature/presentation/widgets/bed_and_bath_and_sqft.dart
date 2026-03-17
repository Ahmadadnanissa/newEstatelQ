import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/details_about_bath.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/details_about_beds.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/details_about_sqft.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BedAndBathAndSqft extends StatefulWidget {
  const BedAndBathAndSqft({super.key});

  @override
  State<BedAndBathAndSqft> createState() => _BedAndBathAndSqftState();
}

class _BedAndBathAndSqftState extends State<BedAndBathAndSqft> {
  String isSelected = 'bed';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  InkWell(
                    focusColor: primaryColor,
                    hoverColor: primaryColor,
                    splashColor: primaryColor,
                    highlightColor: primaryColor,

                    onTap: () {
                      isSelected = 'bed';
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
                          name: '3 beds',
                          fontColor: blackColor,
                          fontSize: width * 0.04,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: isSelected == 'bed' ? width * 0.02 : width * 0.01,
                  ),
                  Container(
                    width: width * 0.18,
                    height: width * 0.0009,
                    color: isSelected == 'bed' ? secondaryColor : primaryColor,
                  ),
                ],
              ),
              Spacer(),
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
                    height: isSelected == 'path' ? width * 0.02 : width * 0.01,
                  ),
                  Container(
                    width: width * 0.18,
                    height: width * 0.0009,
                    color: isSelected == 'path' ? secondaryColor : primaryColor,
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  InkWell(
                    focusColor: primaryColor,
                    hoverColor: primaryColor,
                    splashColor: primaryColor,
                    highlightColor: primaryColor,
                    onTap: () {
                      isSelected = 'sqft';
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.square_outlined,
                          color: secondaryColor,
                          size: width * 0.06,
                        ),
                        SizedBox(width: width * 0.01),
                        CustomFont(
                          name: '2000 sqft',
                          fontColor: blackColor,
                          fontSize: width * 0.04,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: isSelected == 'sqft' ? width * 0.02 : width * 0.01,
                  ),
                  Container(
                    width: width * 0.18,
                    height: width * 0.0009,
                    color: isSelected == 'sqft' ? secondaryColor : primaryColor,
                  ),
                ],
              ),
            ],
          ),
          isSelected == 'bed'
              ? DetailsAboutBeds()
              : isSelected == 'path'
              ? DetailsAboutBath()
              : DetailsAboutSqft(),
        ],
      ),
    );
  }
}

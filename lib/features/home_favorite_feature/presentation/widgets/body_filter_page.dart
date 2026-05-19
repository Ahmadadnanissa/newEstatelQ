import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/form_field_for_location.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/check_number_of_room.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/price_range.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/buy_or_rent_custom_container.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/custom_sub_title_for_filter_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/propery_type_check_in_filter.dart';
import 'package:flutter/material.dart';

class BodyFilterPage extends StatefulWidget {
  const BodyFilterPage({super.key});

  @override
  State<BodyFilterPage> createState() => _BodyFilterPageState();
}

class _BodyFilterPageState extends State<BodyFilterPage> {
  bool isSelectedBuy = true;
  bool isSelectedRent = false;
  String selectedType = 'Apartment';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomSubTitleForFilterPage(title: 'Purpose'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(width * 0.03),
                  onTap: () {
                    isSelectedBuy = true;
                    isSelectedRent = false;
                    setState(() {});
                  },
                  child: BuyOrRentCustomContainer(
                    image: 'assets/images/buy.png',
                    forWhat: 'For Buy',
                    isSelected: isSelectedBuy,
                  ),
                ),

                InkWell(
                  borderRadius: BorderRadius.circular(width * 0.03),
                  onTap: () {
                    isSelectedBuy = false;
                    isSelectedRent = true;
                    setState(() {});
                  },
                  child: BuyOrRentCustomContainer(
                    image: 'assets/images/rent.png',
                    forWhat: 'For Rent',
                    isSelected: isSelectedRent,
                  ),
                ),
              ],
            ),
          ),

          CustomSubTitleForFilterPage(title: 'Property Types'),

          InkWell(
            borderRadius: BorderRadius.circular(width * 0.03),
            onTap: () {
              selectedType = 'Apartment';
              setState(() {});
            },
            child: ProperyTypeCheckInFilter(
              image: 'assets/images/Building.png',
              type: 'Apartment',
              isSelected: selectedType == 'Apartment' ? true : false,
            ),
          ),
          SizedBox(height: width * 0.02),
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.03),
            onTap: () {
              selectedType = 'Villa';
              setState(() {});
            },
            child: ProperyTypeCheckInFilter(
              image: 'assets/images/House With a Garden.png',
              type: 'Villa',
              isSelected: selectedType == 'Villa' ? true : false,
            ),
          ),
          SizedBox(height: width * 0.02),
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.03),
            onTap: () {
              selectedType = 'House';
              setState(() {});
            },
            child: ProperyTypeCheckInFilter(
              image: 'assets/images/Home.png',
              type: 'House',
              isSelected: selectedType == 'House' ? true : false,
            ),
          ),
          SizedBox(height: width * 0.02),
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.03),
            onTap: () {
              selectedType = 'office';
              setState(() {});
            },
            child: ProperyTypeCheckInFilter(
              image: 'assets/images/Office.png',
              type: 'office',
              isSelected: selectedType == 'office' ? true : false,
            ),
          ),
          SizedBox(height: width * 0.02),

          CustomSubTitleForFilterPage(title: 'Price Range'),
          PriceRaange(),

          CustomSubTitleForFilterPage(title: 'Location'),
          FormFieldForLocation(),

          CustomSubTitleForFilterPage(title: 'Numbers of beds'),
          CheckNumberOfRoom(),
          SizedBox(height: width * 0.02),
          PrimaryButton(name: 'Apply', pushing: () async {}),
          SizedBox(height: width * 0.04),
        ],
      ),
    );
  }
}

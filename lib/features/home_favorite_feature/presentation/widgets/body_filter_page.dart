import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/form_field_for_location.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/check_number_of_room.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/price_range.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/provider/home_provider.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/buy_or_rent_custom_container.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/custom_sub_title_for_filter_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/propery_type_check_in_filter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyFilterPage extends StatefulWidget {
  const BodyFilterPage({super.key});

  @override
  State<BodyFilterPage> createState() => _BodyFilterPageState();
}

class _BodyFilterPageState extends State<BodyFilterPage> {
  bool isSelectedBuy = true;
  bool isSelectedRent = false;
  String selectedType = 'All';

  final locationController = TextEditingController();
  final roomController = TextEditingController();
  final minController = TextEditingController();
  final maxController = TextEditingController();
  @override
  void dispose() {
    locationController.dispose();
    roomController.dispose();
    minController.dispose();
    maxController.dispose();
    super.dispose();
  }

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
                    icon: Icons.shopping_cart_outlined,
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
                    icon: Icons.key_outlined,
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
              selectedType = 'APARTMENT';
              setState(() {});
            },
            child: ProperyTypeCheckInFilter(
              icon: Icons.apartment,
              type: 'Apartment',
              isSelected: selectedType == 'APARTMENT',
            ),
          ),

          SizedBox(height: width * 0.02),

          InkWell(
            borderRadius: BorderRadius.circular(width * 0.03),
            onTap: () {
              selectedType = 'VILLA';
              setState(() {});
            },
            child: ProperyTypeCheckInFilter(
              icon: Icons.villa,
              type: 'Villa',
              isSelected: selectedType == 'VILLA',
            ),
          ),

          SizedBox(height: width * 0.02),

          InkWell(
            borderRadius: BorderRadius.circular(width * 0.03),
            onTap: () {
              selectedType = 'HOUSE';
              setState(() {});
            },
            child: ProperyTypeCheckInFilter(
              icon: Icons.home_outlined,
              type: 'House',
              isSelected: selectedType == 'HOUSE',
            ),
          ),

          SizedBox(height: width * 0.02),

          InkWell(
            borderRadius: BorderRadius.circular(width * 0.03),
            onTap: () {
              selectedType = 'OFFICE';
              setState(() {});
            },
            child: ProperyTypeCheckInFilter(
              icon: Icons.business_center_outlined,
              type: 'Office',
              isSelected: selectedType == 'OFFICE',
            ),
          ),

          SizedBox(height: width * 0.02),

          InkWell(
            borderRadius: BorderRadius.circular(width * 0.03),
            onTap: () {
              selectedType = 'STORE';
              setState(() {});
            },
            child: ProperyTypeCheckInFilter(
              icon: Icons.storefront_outlined,
              type: 'Store',
              isSelected: selectedType == 'STORE',
            ),
          ),

          SizedBox(height: width * 0.02),

          CustomSubTitleForFilterPage(title: 'Price Range'),

          PriceRaange(
            minController: minController,
            maxController: maxController,
          ),

          CustomSubTitleForFilterPage(title: 'Location'),

          FormFieldForLocation(controller: locationController),

          CustomSubTitleForFilterPage(title: 'Number of Rooms'),

          CheckNumberOfRoom(controller: roomController),

          SizedBox(height: width * 0.02),

          PrimaryButton(
            name: 'Apply',
            pushing: () async {
              final provider = context.read<HomeProvider>();

              provider.filter.city = locationController.text.isEmpty
                  ? null
                  : locationController.text;

              provider.filter.type = selectedType;
              provider.filter.listingType = isSelectedBuy ? "SALE" : "RENT";

              provider.filter.numOfRooms = roomController.text.isEmpty
                  ? null
                  : int.tryParse(roomController.text);

              provider.filter.minPrice = double.tryParse(minController.text);
              provider.filter.maxPrice = double.tryParse(maxController.text);

              await provider.refresh();
              Navigator.pop(context);
            },
          ),

          SizedBox(height: width * 0.04),
        ],
      ),
    );
  }
}

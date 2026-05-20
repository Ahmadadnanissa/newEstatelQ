import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/provider/home_provider.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/type_of_property.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RowForTypeOfProperty extends StatefulWidget {
  const RowForTypeOfProperty({super.key});

  @override
  State<RowForTypeOfProperty> createState() => _RowForTypeOfPropertyState();
}

class _RowForTypeOfPropertyState extends State<RowForTypeOfProperty> {
  String selectedType = 'All';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            TypeOfProperty(
              backgroundColor: secondaryColor,
              type: 'All',
              image: 'assets/images/Earth Planet.png',
              isSelected: selectedType == 'All',
              onTap: () {
                setState(() {
                  selectedType = 'All';
                });
                context.read<HomeProvider>().setType(selectedType);
              },
            ),
            TypeOfProperty(
              backgroundColor: Color(0xffEDF6F9),
              image: 'assets/images/Building.png',
              type: 'Apartment',
              isSelected: selectedType == 'Apartment',
              onTap: () {
                setState(() {
                  selectedType = 'Apartment';
                });
                context.read<HomeProvider>().setType(selectedType);
              },
            ),
            TypeOfProperty(
              backgroundColor: Color(0xffFFDDD2),
              image: 'assets/images/House With a Garden.png',
              type: 'Villa',
              isSelected: selectedType == 'Villa',
              onTap: () {
                setState(() {
                  selectedType = 'Villa';
                });
                context.read<HomeProvider>().setType(selectedType);
              },
            ),
            TypeOfProperty(
              backgroundColor: greenColor,
              image: 'assets/images/Home.png',
              type: 'House',
              isSelected: selectedType == 'House',
              onTap: () {
                setState(() {
                  selectedType = 'House';
                });
                context.read<HomeProvider>().setType(selectedType);
              },
            ),
            TypeOfProperty(
              backgroundColor: Color(0xffD9D9D9),

              image: 'assets/images/Home.png',

              type: 'Store',

              isSelected: selectedType == 'Store',

              onTap: () {
                setState(() {
                  selectedType = 'Store';
                });

                context.read<HomeProvider>().setType(selectedType);
              },
            ),
            TypeOfProperty(
              backgroundColor: Color(0xffE29578),
              image: 'assets/images/Office.png',
              type: 'office',
              isSelected: selectedType == 'office',
              onTap: () {
                setState(() {
                  selectedType = 'office';
                });
                context.read<HomeProvider>().setType(selectedType);
              },
            ),
          ],
        ),
      ),
    );
  }
}

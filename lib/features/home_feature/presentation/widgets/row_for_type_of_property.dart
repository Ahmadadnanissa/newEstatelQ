import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/home_feature/presentation/widgets/type_of_property.dart';
import 'package:flutter/material.dart';

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
            },
          ),
        ],
      ),
    );
  }
}

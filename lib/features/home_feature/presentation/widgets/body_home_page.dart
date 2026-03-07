import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/form_field_for_location.dart';
import 'package:estatelqapp/features/home_feature/presentation/widgets/filter_icon.dart';
import 'package:estatelqapp/features/home_feature/presentation/widgets/type_of_property.dart';
import 'package:flutter/material.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({super.key});

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: FormFieldForLocation()),
            GestureDetector(onTap: () {}, child: FilterIcon()),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TypeOfProperty(
                type: 'All',
                image: 'assets/images/Earth Planet.png',
              ),
              TypeOfProperty(
                image: 'assets/images/Building.png',
                type: 'Apartment',
              ),
              TypeOfProperty(
                image: 'assets/images/House With a Garden.png',
                type: 'Villa',
              ),
              TypeOfProperty(image: 'assets/images/Home.png', type: 'House'),
              TypeOfProperty(image: 'assets/images/Office.png', type: 'office'),
            ],
          ),
        ),
        Divider(thickness: 0.5),
      ],
    );
  }
}

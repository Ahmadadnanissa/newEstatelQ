import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/custom_card_for_property.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/pages/property_page.dart';
import 'package:flutter/material.dart';

class ListOfCustomCardProperty extends StatefulWidget {
  const ListOfCustomCardProperty({super.key});

  @override
  State<ListOfCustomCardProperty> createState() =>
      _ListOfCustomCardPropertyState();
}

class _ListOfCustomCardPropertyState extends State<ListOfCustomCardProperty> {
  final List properties = [
    {
      "image": "assets/images/apartment.jpg",
      "title": "Modern House",
      "address": "New York",
      "price": "\$1200",
      "type": "Apartment",
      "rooms": 3,
      "bath": 2,
      "sqft": 120,
    },
    {
      "image": "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",
      "title": "Luxury Villa",
      "address": "California",
      "price": "\$3500",
      "type": "Villa",
      "rooms": 5,
      "bath": 4,
      "sqft": 300,
    },
    {
      "image": "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",
      "title": "Luxury Villa",
      "address": "California",
      "price": "\$3500",
      "type": "Villa",
      "rooms": 5,
      "bath": 4,
      "sqft": 300,
    },
    {
      "image": "assets/images/apartment.jpg",
      "title": "Luxury Villa",
      "address": "California",
      "price": "\$3500",
      "type": "Villa",
      "rooms": 5,
      "bath": 4,
      "sqft": 300,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemBuilder: (context, index) {
        final property = properties[index];
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: width * 0.02,
            horizontal: width * 0.04,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, SlideRight(page: PropertyPage()));
            },
            child: CustomCardForProperty(
              image: property["image"],
              title: property["title"],
              address: property["address"],
              price: property["price"],
              type: property["type"],
              numberOfRooms: property["rooms"],
              numberOfPath: property["bath"],
              sqft: property["sqft"],
            ),
          ),
        );
      },
      itemCount: properties.length,
    );
  }
}

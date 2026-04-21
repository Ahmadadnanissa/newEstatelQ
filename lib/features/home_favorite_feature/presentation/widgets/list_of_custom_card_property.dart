import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/custom_card_for_property.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/pages/property_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/home_provider.dart';

class ListOfCustomCardProperty extends StatelessWidget {
  const ListOfCustomCardProperty({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    double width = MediaQuery.of(context).size.width;

    if (provider.isLoading) {
      return Center(child: CircularProgressIndicator(color: secondaryColor));
    }

    if (provider.errorMessage != null) {
      return Center(child: Text(provider.errorMessage!));
    }

    if (provider.properties.isEmpty) {
      return Center(child: Text("No properties found"));
    }

    return ListView.builder(
      itemCount: provider.properties.length,
      itemBuilder: (context, index) {
        final property = provider.properties[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(context, SlideRight(page: PropertyPage()));
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: width * 0.02,
              horizontal: width * 0.04,
            ),
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
    );
  }
}

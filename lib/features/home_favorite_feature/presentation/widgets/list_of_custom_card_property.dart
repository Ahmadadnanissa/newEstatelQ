import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/provider/home_provider.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/custom_card_for_property.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/pages/property_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListOfCustomCardProperty extends StatefulWidget {
  const ListOfCustomCardProperty({super.key});

  @override
  State<ListOfCustomCardProperty> createState() =>
      _ListOfCustomCardPropertyState();
}

class _ListOfCustomCardPropertyState extends State<ListOfCustomCardProperty> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.position.pixels >=
          controller.position.maxScrollExtent - 200) {
        context.read<HomeProvider>().getProperties();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    double width = MediaQuery.of(context).size.width;

    if (provider.isLoading && provider.properties.isEmpty) {
      return Center(child: CircularProgressIndicator(color: secondaryColor));
    }

    if (provider.error != null && provider.properties.isEmpty) {
      return Center(child: Text(provider.error!));
    }

    if (provider.properties.isEmpty) {
      return Center(child: Text("No properties found"));
    }

    return ListView.builder(
      controller: controller,

      itemCount: provider.properties.length + 1,

      itemBuilder: (context, index) {
        if (index < provider.properties.length) {
          final property = provider.properties[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(context, SlideRight(page: PropertyPage()));
            },

            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: width * .02,
                horizontal: width * .04,
              ),

              child: CustomCardForProperty(
                image: property.images.isNotEmpty ? property.images[0] : "",

                title: property.title,

                address: property.location,

                price: "\$${property.price}",

                type: property.type,

                numberOfRooms: property.rooms,

                numberOfPath: property.bathrooms,

                sqft: property.sqft.toInt(),
                id: property.id,
              ),
            ),
          );
        }

        return provider.hasMore
            ? Padding(
                padding: EdgeInsets.all(width * .04),
                child: Center(
                  child: CircularProgressIndicator(color: secondaryColor),
                ),
              )
            : SizedBox();
      },
    );
  }
}

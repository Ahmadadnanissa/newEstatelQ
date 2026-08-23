import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/services/visitor_local_storage.dart';
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
    final provider = context.watch<HomeProvider>();

    double width = MediaQuery.of(context).size.width;

    if (provider.isLoading && provider.properties.isEmpty) {
      return Center(child: CircularProgressIndicator(color: secondaryColor));
    }

    if (provider.error != null && provider.properties.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08),
          child: Text(
            'Something went wrong. Please try again later.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? darkSubtitleColor
                  : Colors.grey.shade600,
              fontSize: width * 0.04,
              fontFamily: fontFamily,
            ),
          ),
        ),
      );
    }

    if (provider.properties.isEmpty) {
      return Center(
        child: Text(
          'No properties found',
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? darkSubtitleColor
                : Colors.grey.shade600,
            fontSize: width * 0.04,
            fontFamily: fontFamily,
          ),
        ),
      );
    }

    return ListView.builder(
      controller: controller,
      itemCount: provider.properties.length + 1,
      itemBuilder: (context, index) {
        if (index < provider.properties.length) {
          final property = provider.properties[index];

          return GestureDetector(
            onTap: () async {
              await VisitorLocalStorageService.saveViewId(
                property.id.toString(),
              );

              Navigator.push(
                context,
                SlideRight(page: PropertyPage(propertyId: property.id)),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: width * .02,
                horizontal: width * .04,
              ),
              child: CustomCardForProperty(
                image: property.primaryImage!,
                title: property.simpleDescription,
                address: property.city,
                price: "\$${property.listedPrice.toInt()}",
                type: property.type,
                numberOfRooms: property.numOfRooms,
                numberOfPath: property.bathrooms.toInt(),
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

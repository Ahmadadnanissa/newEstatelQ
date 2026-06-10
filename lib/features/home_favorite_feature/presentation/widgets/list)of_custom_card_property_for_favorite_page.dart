// import 'package:estatelqapp/core/app_theme.dart';
// import 'package:estatelqapp/core/widgets/navigation_route.dart';
// import 'package:estatelqapp/features/home_favorite_feature/presentation/provider/favorite_provider.dart';
// import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/custom_card_for_property.dart';
// import 'package:estatelqapp/features/property_details_feature/presentation/pages/property_page.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ListOfCustomCardPropertyForFavoritePage extends StatefulWidget {
//   const ListOfCustomCardPropertyForFavoritePage({super.key});

//   @override
//   State<ListOfCustomCardPropertyForFavoritePage> createState() =>
//       _ListOfCustomCardPropertyForFavoritePageState();
// }

// class _ListOfCustomCardPropertyForFavoritePageState
//     extends State<ListOfCustomCardPropertyForFavoritePage> {
//   @override
//   void initState() {
//     super.initState();

//     Future.microtask(() {
//       context.read<FavoriteProvider>().getFavorites();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<FavoriteProvider>(context);

//     double width = MediaQuery.of(context).size.width;

//     if (provider.isLoading && provider.favoriteProperties.isEmpty) {
//       return Center(child: CircularProgressIndicator(color: secondaryColor));
//     }

//     if (provider.error != null && provider.favoriteProperties.isEmpty) {
//       return Center(child: Text(provider.error!));
//     }

//     if (provider.favoriteProperties.isEmpty) {
//       return Center(child: Text("No favorite properties yet"));
//     }

//     return ListView.builder(
//       itemCount: provider.favoriteProperties.length,

//       itemBuilder: (context, index) {
//         final property = provider.favoriteProperties[index];

//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               SlideRight(page: PropertyPage(propertyId: property.id)),
//             );
//           },

//           child: Padding(
//             padding: EdgeInsets.symmetric(
//               vertical: width * .02,

//               horizontal: width * .04,
//             ),

//             child:  CustomCardForProperty(
//                 image: property.primaryImage ?? "",

//                 title: property.simpleDescription,

//                 address: property.city,

//                 price: "\$${property.listedPrice.toInt()}",

//                 type: property.type,

//                 numberOfRooms: property.numOfRooms,

//                 numberOfPath: property.bathrooms,

//                 sqft: property.sqft.toInt(),
//                 id: property.id,
//               ),
//           ),
//         );
//       },
//     );
//   }
// }

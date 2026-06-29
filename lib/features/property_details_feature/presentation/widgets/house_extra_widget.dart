// import 'package:estatelqapp/core/app_theme.dart';
// import 'package:estatelqapp/core/widgets/custom_font.dart';
// import 'package:estatelqapp/features/property_details_feature/data/models/house_model.dart';
// import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_nearby_widget.dart';
// import 'package:flutter/material.dart';

// class HouseExtraWidget extends StatelessWidget {
//   final HouseModel property;

//   const HouseExtraWidget({super.key, required this.property});

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     final Color textColor =
//         Theme.of(context).textTheme.bodyMedium?.color ?? blackColor;
//     List<String> details = [];

//     if (property.numOfFloors != null) {
//       details.add("Floors : ${property.numOfFloors}");
//     }

//     if (property.fireplace) {
//       details.add("Fireplace");
//     }

//     if (property.basementArea != null) {
//       details.add("Basement : ${property.basementArea} m²");
//     }

//     details.add("Heater : ${property.heating}");
//     details.add("Furnished : ${property.furnishing}");
//     details.add("Built : ${property.constructionYear}");

//     return Padding(
//       padding: EdgeInsets.symmetric(
//         vertical: width * 0.02,
//         horizontal: width * 0.03,
//       ),

//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,

//         children: [
//           // ================= TITLE =================
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               CustomFont(
//                 name: 'More Details',
//                 fontColor: textColor,
//                 fontSize: width * 0.055,
//                 fontWeight: FontWeight.w600,
//               ),
//             ],
//           ),

//           SizedBox(height: width * 0.03),

//           // ================= CHIPS =================
//           Wrap(
//             spacing: 10,
//             runSpacing: 10,

//             children: details.map((e) {
//               return CustomNearbyWidget(name: e);
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

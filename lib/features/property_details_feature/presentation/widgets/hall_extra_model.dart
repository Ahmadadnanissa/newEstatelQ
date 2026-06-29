// import 'package:estatelqapp/core/app_theme.dart';
// import 'package:estatelqapp/core/widgets/custom_font.dart';
// import 'package:estatelqapp/features/property_details_feature/data/models/hall_model.dart';
// import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_nearby_widget.dart';
// import 'package:flutter/material.dart';

// class HallExtraWidget extends StatelessWidget {
//   final HallModel property;

//   const HallExtraWidget({super.key, required this.property});

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     List<String> details = [];

//     if (property.floorNumber != null) {
//       details.add("Floor : ${property.floorNumber}");
//     }

//     if (property.elevator) {
//       details.add("Elevator");
//     }

//     details.add("Parking : ${property.parking}");
//     details.add("Heater : ${property.heating}");
//     details.add("Furnished : ${property.furnishing}");
//     details.add("Built : ${property.constructionYear}");

//     final bool isDark = Theme.of(context).brightness == Brightness.dark;

//     final Color cardBg = isDark
//         ? const Color(0xff1C1C1E)
//         : const Color(0xffF7F8FA);

//     final Color textColor =
//         Theme.of(context).textTheme.bodyMedium?.color ?? blackColor;

//     return Padding(
//       padding: EdgeInsets.symmetric(
//         vertical: width * .02,
//         horizontal: width * .03,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// Title
//           CustomFont(
//             name: 'More Details',
//             fontColor: textColor,
//             fontSize: width * .05,
//             fontWeight: FontWeight.bold,
//           ),

//           SizedBox(height: width * 0.04),

//           /// Chips
//           Wrap(
//             spacing: 10,
//             runSpacing: 10,
//             children: details.map((e) {
//               return Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: width * 0.04,
//                   vertical: width * 0.02,
//                 ),
//                 decoration: BoxDecoration(
//                   color: cardBg,
//                   borderRadius: BorderRadius.circular(width * 0.03),
//                   border: Border.all(color: greenColor.withOpacity(0.25)),
//                 ),
//                 child: CustomFont(
//                   name: e,
//                   fontColor: textColor.withOpacity(0.8),
//                   fontSize: width * 0.035,
//                   fontWeight: FontWeight.w500,
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

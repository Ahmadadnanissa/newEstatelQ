// import 'package:estatelqapp/core/app_theme.dart';
// import 'package:estatelqapp/core/widgets/custom_font.dart';
// import 'package:flutter/material.dart';

// import '../../data/models/appartment_model.dart';
// import 'custom_nearby_widget.dart';

// class ApartmentExtraWidget extends StatelessWidget {
//   final ApartmentModel property;

//   const ApartmentExtraWidget({super.key, required this.property});

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     final bool isDark = Theme.of(context).brightness == Brightness.dark;

//     final Color titleColor = secondaryColor;

//     final Color textColor = isDark ? darkSubtitleColor : Colors.grey;

//     List<String> details = [];

//     if (property.floorNumber != null) {
//       details.add("Floor : ${property.floorNumber}");
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
//                 fontColor: titleColor,
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

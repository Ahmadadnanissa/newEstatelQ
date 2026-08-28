// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/chat_provider.dart';

// class CustomTextFieldForSendMessage extends StatelessWidget {
//   const CustomTextFieldForSendMessage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     return Expanded(
//       child: Consumer<ChatProvider>(
//         builder: (context, provider, child) {
//           return Container(
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Theme.of(
//                     context,
//                   ).colorScheme.onSurface.withValues(alpha: 0.15),
//                   offset: const Offset(0, 3),
//                   blurRadius: 10,
//                 ),
//               ],
//             ),
//             child: TextFormField(
//               controller: provider.controller,
//               textAlign: TextAlign.start,
//               textAlignVertical: TextAlignVertical.center,

//               style: TextStyle(color: Theme.of(context).colorScheme.onSurface),

//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(
//                   vertical: width * 0.025,
//                   horizontal: width * 0.05,
//                 ),

//                 filled: true,
//                 fillColor: Theme.of(context).colorScheme.surface,

//                 hintText: 'Write a Message',

//                 hintStyle: TextStyle(
//                   color: Theme.of(
//                     context,
//                   ).colorScheme.onSurface.withValues(alpha: 0.5),
//                   fontFamily: Theme.of(
//                     context,
//                   ).textTheme.bodyMedium?.fontFamily,
//                   fontSize: width * 0.04,
//                 ),

//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16),
//                   borderSide: BorderSide(
//                     color: Theme.of(context).colorScheme.surface,
//                   ),
//                 ),

//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16),
//                   borderSide: BorderSide(
//                     color: Theme.of(context).colorScheme.primary,
//                     width: 1.2,
//                   ),
//                 ),

//                 errorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16),
//                   borderSide: BorderSide(
//                     color: Theme.of(context).colorScheme.error,
//                   ),
//                 ),

//                 focusedErrorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16),
//                   borderSide: BorderSide(
//                     color: Theme.of(context).colorScheme.error,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

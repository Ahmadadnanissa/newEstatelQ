// import 'package:estatelqapp/core/widgets/navigation_route.dart';
// import 'package:estatelqapp/features/menu_feature/data/models/room_chat_model.dart';
// import 'package:estatelqapp/features/menu_feature/presentation/pages/live_chat_page.dart';
// import 'package:estatelqapp/features/menu_feature/presentation/widgets/custom_room_card.dart';
// import 'package:flutter/material.dart';

// class BodyRoomsLiveChatPage extends StatefulWidget {
//   const BodyRoomsLiveChatPage({super.key});

//   @override
//   State<BodyRoomsLiveChatPage> createState() => _BodyRoomsLiveChatPageState();
// }

// class _BodyRoomsLiveChatPageState extends State<BodyRoomsLiveChatPage> {
//   List<RoomChatModel> rooms = [
//     RoomChatModel(
//       id: "1",
//       title: 'Modern Villa',
//       body: "I am interested in this property",
//       image: "assets/images/apartment.jpg",
//     ),
//     RoomChatModel(
//       id: "2",
//       title: 'Modern Appartment',
//       body: "I am interested in this property",
//       image: "assets/images/apartment.jpg",
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: rooms.length,
//       itemBuilder: (context, index) {
//         final room = rooms[index];
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               SlideRight(page: LiveChatPage(dealId: room.id)),
//             );
//           },
//           child: CustomRoomCard(room: room),
//         );
//       },
//     );
//   }
// }

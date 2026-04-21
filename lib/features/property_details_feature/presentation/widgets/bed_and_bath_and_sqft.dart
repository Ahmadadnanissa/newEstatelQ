import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/room_model.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/details_about_beds.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BedAndBathAndSqft extends StatefulWidget {
  final List<Room> rooms;
  const BedAndBathAndSqft({super.key, required this.rooms});

  @override
  State<BedAndBathAndSqft> createState() => _BedAndBathAndSqftState();
}

IconData getIcon(String type) {
  switch (type) {
    case 'bedroom':
      return Icons.bed;
    case 'bathroom':
      return Icons.bathroom;
    case 'kitchen':
      return Icons.kitchen;
    case 'living':
      return Icons.living;
    default:
      return Icons.home;
  }
}

String getImage(List<String> images, int index) {
  if (images.length > index) {
    return images[index];
  } else {
    return 'assets/images/bogdan-vaskan-1taEJJwIv-0-unsplash.jpg';
  }
}

class _BedAndBathAndSqftState extends State<BedAndBathAndSqft> {
  String? selectedRoomId;

  @override
  void initState() {
    super.initState();
    if (widget.rooms.isNotEmpty) {
      selectedRoomId = widget.rooms.first.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (widget.rooms.isEmpty) return SizedBox();

    final selectedRoom = widget.rooms.firstWhere(
      (room) => room.id == selectedRoomId,
      orElse: () => widget.rooms.first,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: width * 0.15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.rooms.length,
            itemBuilder: (context, index) {
              final room = widget.rooms[index];
              final isSelected = room.id == selectedRoomId;

              return Padding(
                padding: EdgeInsets.only(right: width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      focusColor: Colors.white,
                      hoverColor: Colors.white,
                      splashColor: Colors.white,
                      highlightColor: Colors.white,
                      onTap: () {
                        setState(() {
                          selectedRoomId = room.id;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            getIcon(room.type),
                            color: isSelected ? secondaryColor : greenColor,
                            size: width * 0.08,
                          ),
                          SizedBox(width: width * 0.01),
                          CustomFont(
                            name: room.name,
                            fontColor: isSelected ? secondaryColor : blackColor,
                            fontSize: width * 0.04,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: width * 0.01),
                    Container(
                      width: width * 0.18,
                      height: 2,
                      color: isSelected ? secondaryColor : greenColor,
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        SizedBox(height: width * 0.02),

        AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0.0, 0.2),
                  end: Offset(0.0, 0.0),
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: DetailsAboutBeds(
            key: ValueKey(selectedRoom.id),
            descr: selectedRoom.description,
            image1: getImage(selectedRoom.images, 0),
            image2: getImage(selectedRoom.images, 1),
            image3: getImage(selectedRoom.images, 2),
            image4: getImage(selectedRoom.images, 3),
          ),
        ),
      ],
    );
  }
}

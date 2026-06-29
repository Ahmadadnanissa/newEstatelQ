import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/room_item.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/details_about_beds.dart';
import 'package:flutter/material.dart';

class RoomDetailsWidget extends StatefulWidget {
  final List<RoomItem> rooms;

  const RoomDetailsWidget({super.key, required this.rooms});

  @override
  State<RoomDetailsWidget> createState() => _RoomDetailsWidgetState();
}

class _RoomDetailsWidgetState extends State<RoomDetailsWidget> {
  int selectedIndex = 0;
  String formatOutdoorType(String type) {
    return type
        .toLowerCase()
        .split('_')
        .map(
          (word) =>
              word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '',
        )
        .join(' ');
  }

  IconData getIcon(String type) {
    switch (type.toUpperCase()) {
      case "BEDROOM":
      case "MASTER_BEDROOM":
        return Icons.bed_rounded;

      case "BATHROOM":
      case "ENSUITE_BATHROOM":
        return Icons.bathtub_rounded;

      case "KITCHEN":
        return Icons.kitchen_rounded;

      case "LIVING_ROOM":
        return Icons.weekend_rounded;

      case "DINING_ROOM":
        return Icons.table_restaurant_rounded;

      case "FAMILY_ROOM":
        return Icons.chair_rounded;

      default:
        return Icons.home_rounded;
    }
  }

  String getImage(List<String> images, int index) {
    if (images.length > index) {
      return images[index];
    }
    return "assets/images/bogdan-vaskan-1taEJJwIv-0-unsplash.jpg";
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color activeColor = secondaryColor;
    final Color inactiveColor = isDark ? darkSubtitleColor : Colors.grey;

    if (widget.rooms.isEmpty) {
      return const SizedBox();
    }

    final selectedRoom = widget.rooms[selectedIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 ROOM TYPES LIST
        SizedBox(
          height: width * .15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.rooms.length,
            itemBuilder: (context, index) {
              final room = widget.rooms[index];
              final isSelected = index == selectedIndex;

              return Padding(
                padding: EdgeInsets.only(right: width * .05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            getIcon(room.type),
                            color: isSelected ? activeColor : inactiveColor,
                            size: width * .08,
                          ),

                          SizedBox(width: width * .01),

                          CustomFont(
                            name: formatOutdoorType(room.type),
                            fontColor: isSelected ? activeColor : inactiveColor,
                            fontSize: width * .04,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: width * .01),

                    Container(
                      width: width * .18,
                      height: 2,
                      color: isSelected
                          ? activeColor
                          : inactiveColor.withValues(alpha: 0.4),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        SizedBox(height: width * .02),

        /// 🔹 ROOM DETAILS
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, .2),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },

          child: DetailsAboutBeds(
            key: ValueKey(selectedIndex),
            descr: selectedRoom.description,
            image1: getImage([
              'assets/images/spacejoy-KJUGhE9ojro-unsplash.jpg',
              'assets/images/spacejoy-nEtpvJjnPVo-unsplash.jpg',
            ], 0),
            image2: getImage([
              'assets/images/spacejoy-KJUGhE9ojro-unsplash.jpg',
              'assets/images/spacejoy-nEtpvJjnPVo-unsplash.jpg',
            ], 1),
            image3: getImage([
              'assets/images/spacejoy-KJUGhE9ojro-unsplash.jpg',
              'assets/images/spacejoy-nEtpvJjnPVo-unsplash.jpg',
            ], 0),
            image4: getImage([
              'assets/images/spacejoy-KJUGhE9ojro-unsplash.jpg',
              'assets/images/spacejoy-nEtpvJjnPVo-unsplash.jpg',
            ], 1),
          ),
        ),

        SizedBox(height: width * .03),

        /// 🔹 SIZE
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .03),
          child: CustomFont(
            name: "Room Size : ${selectedRoom.size} m²",
            fontColor: activeColor,
            fontSize: width * .04,
          ),
        ),

        /// 🔹 BALCONY
        if (selectedRoom.hasBalcony)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .03),
            child: CustomFont(
              name: "Has Balcony",
              fontColor: isDark ? Colors.lightGreenAccent : greenColor,
              fontSize: width * .04,
            ),
          ),

        SizedBox(height: width * .03),
      ],
    );
  }
}

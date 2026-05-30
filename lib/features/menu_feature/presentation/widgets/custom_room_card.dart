import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/menu_feature/data/models/room_chat_model.dart';
import 'package:flutter/material.dart';

class CustomRoomCard extends StatelessWidget {
  const CustomRoomCard({super.key, required this.room});

  final RoomChatModel room;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,

          borderRadius: BorderRadius.circular(width * 0.03),

          border: Border.all(
            color: isDark
                ? darkSurfaceColor
                : greenColor.withValues(alpha: 0.25),
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.12 : 0.08),

              offset: const Offset(0, 3),

              blurRadius: 10,
            ),
          ],
        ),

        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Padding(
                  padding: const EdgeInsets.all(8),

                  child: CircleAvatar(
                    radius: width * 0.09,

                    backgroundImage: AssetImage(room.image!),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        CustomFont(
                          name: room.title,

                          fontColor: secondaryColor,

                          fontSize: width * 0.04,

                          fontWeight: FontWeight.w600,
                        ),

                        SizedBox(height: width * 0.01),

                        Text(
                          room.body,

                          textAlign: TextAlign.start,

                          softWrap: true,

                          maxLines: 2,

                          overflow: TextOverflow.ellipsis,

                          style: TextStyle(
                            color: isDark ? darkSubtitleColor : Colors.grey,

                            fontSize: width * 0.032,

                            fontFamily: fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

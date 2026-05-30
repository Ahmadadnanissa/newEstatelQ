import 'package:flutter/material.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/list_your_property_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/notification_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/property_status_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/rooms_live_chat_page.dart';

class CheckPageToNavigate extends StatelessWidget {
  const CheckPageToNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(left: width * 0.24, top: width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            focusColor: colorScheme.surface,
            hoverColor: colorScheme.surface,
            splashColor: colorScheme.surface,
            onTap: () {
              Navigator.pushReplacement(
                context,
                SlideLeft(0, page: RoomsLiveChatPage()),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.chat_bubble_outline_rounded,
                  size: width * 0.065,
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                SizedBox(width: width * 0.04),
                CustomFont(
                  name: 'Live Chat',
                  fontColor: colorScheme.onSurface,
                  fontSize: width * 0.045,
                ),
              ],
            ),
          ),

          SizedBox(height: width * 0.03),

          InkWell(
            focusColor: colorScheme.surface,
            hoverColor: colorScheme.surface,
            splashColor: colorScheme.surface,
            onTap: () {
              Navigator.pushReplacement(
                context,
                SlideLeft(0, page: ListYourPropertyPage()),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.list_alt_rounded,
                  size: width * 0.065,
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                SizedBox(width: width * 0.04),
                CustomFont(
                  name: 'List Your Property',
                  fontColor: colorScheme.onSurface,
                  fontSize: width * 0.045,
                ),
              ],
            ),
          ),

          SizedBox(height: width * 0.03),

          InkWell(
            focusColor: colorScheme.surface,
            hoverColor: colorScheme.surface,
            splashColor: colorScheme.surface,
            onTap: () {
              Navigator.pushReplacement(
                context,
                SlideLeft(0, page: NotificationPage()),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.notifications_none_rounded,
                  size: width * 0.065,
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                SizedBox(width: width * 0.04),
                CustomFont(
                  name: 'Notifications',
                  fontColor: colorScheme.onSurface,
                  fontSize: width * 0.045,
                ),
              ],
            ),
          ),

          SizedBox(height: width * 0.03),

          InkWell(
            focusColor: colorScheme.surface,
            hoverColor: colorScheme.surface,
            splashColor: colorScheme.surface,
            onTap: () {
              Navigator.pushReplacement(
                context,
                SlideLeft(0, page: PropertyStatusPage()),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_work_outlined,
                  size: width * 0.065,
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                SizedBox(width: width * 0.04),
                CustomFont(
                  name: 'My Property Status',
                  fontColor: colorScheme.onSurface,
                  fontSize: width * 0.045,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

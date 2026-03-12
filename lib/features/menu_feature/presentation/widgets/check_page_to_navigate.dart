import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/live_chat_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/notification_page.dart';
import 'package:flutter/material.dart';

class CheckPageToNavigate extends StatelessWidget {
  const CheckPageToNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.24, top: width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            focusColor: Color(0xffEDF6F9),
            hoverColor: Color(0xffEDF6F9),
            splashColor: Color(0xffEDF6F9),
            onTap: () {
              Navigator.pushReplacement(
                context,
                SlideLeft(0, page: LiveChatPage()),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.chat_bubble_outline,
                  size: width * 0.06,
                  color: Color(0xff5F6264),
                ),
                SizedBox(width: width * 0.04),
                CustomFont(
                  name: 'Live Chat',
                  fontColor: blackColor,
                  fontSize: width * 0.04,
                ),
              ],
            ),
          ),
          SizedBox(height: width * 0.02),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.list, size: width * 0.06, color: Color(0xff5F6264)),
              SizedBox(width: width * 0.04),
              CustomFont(
                name: 'List Your Property',
                fontColor: blackColor,
                fontSize: width * 0.04,
              ),
            ],
          ),

          SizedBox(height: width * 0.02),
          InkWell(
            focusColor: Color(0xffEDF6F9),
            hoverColor: Color(0xffEDF6F9),
            splashColor: Color(0xffEDF6F9),
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
                  Icons.notifications,
                  size: width * 0.06,
                  color: Color(0xff5F6264),
                ),
                SizedBox(width: width * 0.04),
                CustomFont(
                  name: 'Notifications',
                  fontColor: blackColor,
                  fontSize: width * 0.04,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

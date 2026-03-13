import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/filter_icon.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/body_of_notification.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/custom_botton_for_notification_page.dart';
import 'package:flutter/material.dart';

class BodyNotificationPage extends StatelessWidget {
  const BodyNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: width * 0.04,
              bottom: width * 0.04,
              left: width * 0.04,
              right: width * 0.04,
            ),
            child: Row(
              children: [
                CustomBottonForNotificationPage(name: 'All'),
                SizedBox(width: width * 0.03),
                CustomBottonForNotificationPage(name: 'Unread'),
                Spacer(),
                FilterIcon(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.04, bottom: width * 0.02),
            child: CustomFont(
              name: 'Today',
              fontColor: blackColor,
              fontSize: width * 0.05,
            ),
          ),
          BodyOfNotification(
            title: 'New Property Added',
            subTitle:
                ' A new property matching your preferences is now available',
            image: 'assets/images/jesse-collins-LUitWpwc008-unsplash.jpg',
          ),

          BodyOfNotification(
            title: 'Property Near You',
            subTitle: 'A new listing was added in your area',
            image: 'assets/images/apartment.jpg',
          ),

          Padding(
            padding: EdgeInsets.only(left: width * 0.04, bottom: width * 0.02),
            child: CustomFont(
              name: 'Yesterday',
              fontColor: blackColor,
              fontSize: width * 0.05,
            ),
          ),
          BodyOfNotification(
            title: ' Price Drop',
            subTitle: 'The price of a property you saved has been reduced',
            image: 'assets/images/jesse-collins-LUitWpwc008-unsplash.jpg',
          ),

          BodyOfNotification(
            title: 'New Offer Available',
            subTitle: 'A special discount is now available on this property',
            image: 'assets/images/apartment.jpg',
          ),
        ],
      ),
    );
  }
}

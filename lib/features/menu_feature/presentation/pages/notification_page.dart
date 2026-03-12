import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/customm_app_bar.dart.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/body_notification_page.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  static String id = 'NotificationPage';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: CustommAppBar(
        title: 'Notifications',
        sizeTitle: width * 0.06,
        iconLeading: Icon(
          Icons.chevron_left,
          color: secondaryColor,
          size: width * 0.1,
        ),
        onTapleading: () {
          Navigator.pop(context);
        },
      ),
      body: BodyNotificationPage(),
    );
  }
}

import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/notification_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/body_of_notification.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/custom_botton_for_notification_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyNotificationPage extends StatefulWidget {
  const BodyNotificationPage({super.key});

  @override
  State<BodyNotificationPage> createState() => _BodyNotificationPageState();
}

class _BodyNotificationPageState extends State<BodyNotificationPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<NotificationProvider>();
      provider.loadAll();
      provider.connectSocket();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Consumer<NotificationProvider>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(width * 0.04),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.loadAll();
                    },
                    child: CustomBottonForNotificationPage(name: 'All'),
                  ),
                  SizedBox(width: width * 0.03),
                  GestureDetector(
                    onTap: () {
                      provider.loadUnread();
                    },
                    child: CustomBottonForNotificationPage(
                      name: 'New',
                      number: provider.notifications
                          .where((n) => !n.isRead)
                          .length,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: provider.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : provider.notifications.isEmpty
                  ? Center(child: Text("No notifications yet"))
                  : ListView.builder(
                      itemCount: provider.notifications.length,
                      itemBuilder: (context, index) {
                        final notification = provider.notifications[index];

                        return BodyOfNotification(notification: notification);
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}

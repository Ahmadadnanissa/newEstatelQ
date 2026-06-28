import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/property_status_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/notification_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/body_of_notification.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/custom_botton_for_notification_page.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/pages/property_page.dart';
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
                      number: provider.unreadCount,
                      //  provider.notifications
                      //     .where((n) => !n.isRead)
                      //     .length,
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

                        return GestureDetector(
                          onTap: () async {
                            await context
                                .read<NotificationProvider>()
                                .markAsRead(notification.id);

                            if (notification.entityId == null) {
                              Navigator.push(
                                context,
                                SlideRight(page: PropertyStatusPage()),
                              );
                            } else {
                              Navigator.push(
                                context,
                                SlideRight(
                                  page: PropertyPage(
                                    propertyId: notification.entityId!,
                                  ),
                                ),
                              );
                            }
                          },
                          child: BodyOfNotification(notification: notification),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}

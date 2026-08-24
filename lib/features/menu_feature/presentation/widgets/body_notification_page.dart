import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/menu_feature/data/models/notification_model.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/property_status_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/notification_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/schedule_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/body_of_notification.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/body_of_schedule_notification.dart';
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
  void dispose() {
    context.read<NotificationProvider>().cancelMarkAllTimer();
    super.dispose();
  }

  Future<void> _handleNotificationTap(
    BuildContext context,
    AppNotification notification,
  ) async {
    await context.read<NotificationProvider>().markAsRead(notification.id);

    if (!context.mounted) return;

    if (notification.entityId == null) {
      Navigator.push(context, SlideRight(page: PropertyStatusPage()));
    } else {
      Navigator.push(
        context,
        SlideRight(page: PropertyPage(propertyId: notification.entityId!)),
      );
    }
  }

  Widget _buildNotification(
    BuildContext context,
    AppNotification notification,
  ) {
    // Schedule notification
    if (notification.entityType == "SCHEDULE") {
      return BodyOfScheduleNotification(
        notification: notification,

        onYes: () async {
          await context.read<ScheduleProvider>().acceptSchedule(
            scheduleId: notification.entityId!,
          );
          debugPrint("YES - Schedule: ${notification.id}");
        },

        onNo: () async {
          await context.read<ScheduleProvider>().rejectSchedule(
            scheduleId: notification.entityId!,
          );
          debugPrint("NO - Schedule: ${notification.id}");
        },
      );
    }

    // Normal notification
    return GestureDetector(
      onTap: () {
        _handleNotificationTap(context, notification);
      },
      child: BodyOfNotification(notification: notification),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Consumer<NotificationProvider>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // All / New buttons
            Padding(
              padding: EdgeInsets.all(width * 0.04),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.cancelMarkAllTimer();
                      provider.loadAll();
                    },
                    child: CustomBottonForNotificationPage(name: 'All'),
                  ),

                  SizedBox(width: width * 0.03),

                  GestureDetector(
                    onTap: () {
                      provider.loadUnread();
                      provider.startMarkAllTimer();
                    },
                    child: CustomBottonForNotificationPage(
                      name: 'New',
                      number: provider.unreadCount,
                    ),
                  ),
                ],
              ),
            ),

            // Notifications list
            Expanded(
              child: provider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : provider.notifications.isEmpty
                  ? const Center(child: Text("No notifications yet"))
                  : ListView.builder(
                      itemCount: provider.notifications.length,
                      itemBuilder: (context, index) {
                        final notification = provider.notifications[index];

                        return _buildNotification(context, notification);
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}

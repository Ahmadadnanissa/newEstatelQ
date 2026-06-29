import 'package:estatelqapp/features/menu_feature/data/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class BodyOfNotification extends StatelessWidget {
  const BodyOfNotification({super.key, required this.notification});

  final AppNotification notification;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final isUnread = notification.isRead != true;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.15),
              offset: const Offset(0, 3),
              blurRadius: 10,
            ),
          ],
          color: isUnread
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.06)
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(width * 0.01),
        ),

        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: CircleAvatar(
                          radius: width * 0.075,
                          backgroundImage: AssetImage(
                            'assets/images/backbone-L4iRkKL5dng-unsplash.jpg',
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notification.title,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            SizedBox(
                              width: width * 0.7,
                              child: Text(
                                notification.body,
                                textAlign: TextAlign.start,
                                softWrap: true,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSurface
                                      .withValues(alpha: 0.7),
                                  fontSize: width * 0.03,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          timeago.format(notification.createdAt),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: width * 0.025,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (isUnread)
              Container(
                width: 4,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

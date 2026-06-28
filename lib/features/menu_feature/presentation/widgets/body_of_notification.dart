import 'package:estatelqapp/features/menu_feature/data/models/notification_model.dart';
import 'package:flutter/material.dart';

class BodyOfNotification extends StatelessWidget {
  const BodyOfNotification({super.key, required this.notification});

  final AppNotification notification;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(width * 0.01),
        ),

        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: CircleAvatar(
                    radius: width * 0.09,
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
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withValues(alpha: 0.7),
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
                    notification.createdAt.toString(),
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
    );
  }
}

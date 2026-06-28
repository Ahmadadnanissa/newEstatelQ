import 'package:estatelqapp/features/menu_feature/data/datasources/notification_remote.dart';
import 'package:estatelqapp/features/menu_feature/data/models/notification_model.dart';

class NotificationRepository {
  final NotificationRemoteDataSource remote;

  NotificationRepository(this.remote);

  Future<List<AppNotification>> getAll() {
    return remote.getAllNotifications();
  }

  Future<List<AppNotification>> getUnread() {
    return remote.getAllNotifications(isRead: false);
  }

  Future<List<AppNotification>> getRead() {
    return remote.getAllNotifications(isRead: true);
  }

  Future<int> getUnreadCount() {
    return remote.getUnreadCount();
  }

  Future<void> markAsRead(String notificationId) {
    return remote.markAsRead(notificationId);
  }

  Future<void> markAllAsRead() {
    return remote.markAllAsRead();
  }
}

import 'package:estatelqapp/features/menu_feature/data/datasources/notification_remote.dart';
import 'package:estatelqapp/features/menu_feature/data/models/notification_model.dart';

class NotificationRepository {
  final NotificationRemoteDataSource remote;

  NotificationRepository(this.remote);

  Future<List<AppNotification>> getAll() {
    return remote.getAllNotifications();
  }

  Future<List<AppNotification>> getUnread() {
    return remote.getUnreadNotifications();
  }

  Future<void> markAsRead(List<String> ids) {
    return remote.markAsRead(ids);
  }
}

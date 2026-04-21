import 'package:estatelqapp/features/menu_feature/data/datasources/notification_remote.dart';
import 'package:estatelqapp/features/menu_feature/data/models/notification_model.dart';
import 'package:estatelqapp/features/menu_feature/domain/repository/notification.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remote;

  NotificationRepositoryImpl(this.remote);

  @override
  Future<List<AppNotification>> getAll() {
    return remote.getAllNotifications();
  }

  @override
  Future<List<AppNotification>> getUnread() {
    return remote.getUnreadNotifications();
  }
}

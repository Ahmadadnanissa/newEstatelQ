import 'package:estatelqapp/features/menu_feature/data/models/notification_model.dart';

abstract class NotificationRepository {
  Future<List<AppNotification>> getAll();
  Future<List<AppNotification>> getUnread();
}

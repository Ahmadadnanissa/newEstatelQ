import 'package:estatelqapp/features/menu_feature/domain/repository/notification.dart';
import 'package:estatelqapp/features/menu_feature/data/models/notification_model.dart';

class GetUnreadNotificationsUseCase {
  final NotificationRepository repository;

  GetUnreadNotificationsUseCase(this.repository);

  Future<List<AppNotification>> execute() {
    return repository.getUnread();
  }
}

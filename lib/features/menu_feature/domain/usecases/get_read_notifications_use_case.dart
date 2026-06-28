import 'package:estatelqapp/features/menu_feature/domain/repository/notification.dart';
import 'package:estatelqapp/features/menu_feature/data/models/notification_model.dart';

class GetReadNotificationsUseCase {
  final NotificationRepository repository;

  GetReadNotificationsUseCase(this.repository);

  Future<List<AppNotification>> execute() {
    return repository.getRead();
  }
}

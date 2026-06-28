import 'package:estatelqapp/features/menu_feature/domain/repository/notification.dart';

class MarkAllAsReadUseCase {
  final NotificationRepository repository;

  MarkAllAsReadUseCase(this.repository);

  Future<void> execute() {
    return repository.markAllAsRead();
  }
}

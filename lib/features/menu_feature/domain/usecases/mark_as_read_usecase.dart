import 'package:estatelqapp/features/menu_feature/domain/repository/notification.dart';

class MarkAsReadUseCase {
  final NotificationRepository repository;

  MarkAsReadUseCase(this.repository);

  Future<void> execute(List<String> ids) {
    return repository.markAsRead(ids);
  }
}

import 'package:estatelqapp/features/menu_feature/domain/repository/notification.dart';

class GetUnreadCountUseCase {
  final NotificationRepository repository;

  GetUnreadCountUseCase(this.repository);

  Future<int> execute() {
    return repository.getUnreadCount();
  }
}

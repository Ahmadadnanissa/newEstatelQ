import 'package:estatelqapp/core/services/socket_service.dart';
import 'package:estatelqapp/core/widgets/notification_overlay.dart';
import 'package:estatelqapp/features/menu_feature/data/models/notification_model.dart';
import 'package:estatelqapp/features/menu_feature/domain/repository/notification.dart';
import 'package:estatelqapp/features/menu_feature/domain/usecases/mark_as_read_use_case.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  final NotificationRepository repo;

  final SocketService socketService;

  final MarkAsReadUseCase markAsReadUseCase;

  NotificationProvider(this.repo, this.socketService, this.markAsReadUseCase);

  List<AppNotification> notifications = [];
  bool _isSocketInitialized = false;

  bool isLoading = false;

  int unreadCount = 0;

  Future<void> loadAll() async {
    try {
      isLoading = true;

      notifyListeners();

      notifications = await repo.getAll();

      unreadCount = await repo.getUnreadCount();
    } catch (e) {
      print(e);
    }

    isLoading = false;

    notifyListeners();
  }

  Future<void> loadUnread() async {
    try {
      isLoading = true;

      notifyListeners();
      notifications = await repo.getUnread();
      unreadCount = await repo.getUnreadCount();
    } catch (e) {
      print(e);
    }

    isLoading = false;

    notifyListeners();
  }

  void connectSocket() {
    if (_isSocketInitialized) return;

    _isSocketInitialized = true;
    socketService.connect();

    socketService.listen("notification", (data) {
      final notification = AppNotification.fromJson(data);

      final exists = notifications.any((n) => n.id == notification.id);

      if (!exists) {
        notifications.insert(0, notification);
      }

      NotificationOverlay.show(notification.title, notification.body);

      notifyListeners();
    });

    socketService.listen("unreadCount", (count) {
      unreadCount = count;

      notifyListeners();
    });
  }

  Future<void> markAsRead(String notificationId) async {
    try {
      await markAsReadUseCase.execute(notificationId);

      await loadAll();

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> markAllAsRead() async {
    try {
      await repo.markAllAsRead();

      unreadCount = 0;

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

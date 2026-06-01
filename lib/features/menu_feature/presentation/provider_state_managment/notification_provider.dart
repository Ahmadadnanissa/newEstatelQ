import 'package:estatelqapp/core/services/socket_service.dart';
import 'package:estatelqapp/core/widgets/notification_overlay.dart';
import 'package:estatelqapp/features/menu_feature/domain/repository/notification.dart';
import 'package:flutter/material.dart';
import '../../data/models/notification_model.dart';

import '../../domain/usecases/mark_as_read_usecase.dart';

class NotificationProvider extends ChangeNotifier {
  final NotificationRepository repo;
  final SocketService socketService;
  final MarkAsReadUseCase markAsReadUseCase;

  NotificationProvider(this.repo, this.socketService, this.markAsReadUseCase);

  List<AppNotification> notifications = [];
  bool isLoading = false;

  Future<void> loadAll() async {
    isLoading = true;
    notifyListeners();

    try {
      notifications = await repo.getAll();
    } catch (e) {
      print(e);
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadUnread() async {
    isLoading = true;
    notifyListeners();

    try {
      notifications = await repo.getUnread();
    } catch (e) {
      print(e);
    }

    isLoading = false;
    notifyListeners();
  }

  void connectSocket(String id, String userType) {
    socketService.connect();

    socketService.emit("register_user", {"id": id, "userType": userType});

    socketService.listen("new_notification", (data) {
      final notif = AppNotification.fromJson(data);

      notifications.insert(0, notif);
      notifyListeners();
      NotificationOverlay.show(notif.title, notif.body);
    });
  }

  Future<void> markAsRead(String id) async {
    try {
      await markAsReadUseCase.execute([id]);

      notifications = notifications.map((n) {
        if (n.id == id) {
          return AppNotification(
            id: n.id,
            title: n.title,
            body: n.body,
            image: n.image,
            createdAt: n.createdAt,
            isRead: true,
            entityId: n.entityId,
            type: n.type,
          );
        }
        return n;
      }).toList();

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

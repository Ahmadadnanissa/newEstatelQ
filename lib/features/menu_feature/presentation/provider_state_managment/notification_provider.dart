import 'dart:async';

import 'package:estatelqapp/core/services/app_navigation.dart';
import 'package:estatelqapp/core/services/socket_service.dart';
import 'package:estatelqapp/core/widgets/notification_overlay.dart';
import 'package:estatelqapp/core/widgets/schedule_notification_overlay.dart';
import 'package:estatelqapp/features/menu_feature/data/models/notification_model.dart';
import 'package:estatelqapp/features/menu_feature/domain/repository/notification.dart';
import 'package:estatelqapp/features/menu_feature/domain/usecases/mark_as_read_use_case.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/schedule_provider.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  final ScheduleProvider scheduleProvider;

  final NotificationRepository repo;

  final SocketService socketService;

  final MarkAsReadUseCase markAsReadUseCase;

  NotificationProvider(
    this.repo,
    this.socketService,
    this.markAsReadUseCase,
    this.scheduleProvider,
  );

  List<AppNotification> notifications = [];
  bool _isSocketInitialized = false;

  bool isLoading = false;
  Timer? _markAllTimer;

  int unreadCount = 0;
  void startMarkAllTimer() {
    _markAllTimer?.cancel();

    _markAllTimer = Timer(const Duration(minutes: 2), () async {
      await markAllAsRead();
    });
  }

  void cancelMarkAllTimer() {
    _markAllTimer?.cancel();
  }

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
      if (notification.entityType == "SCHEDULE" &&
          notification.entityId != null) {
        ScheduleNotificationOverlay.show(
          title: notification.title,
          body: notification.body,
          createdAt: notification.createdAt,

          // YES = ACCEPT
          onYes: () async {
            await scheduleProvider.acceptSchedule(
              scheduleId: notification.entityId!,
            );
          },

          // NO = REJECT
          onNo: () async {
            await scheduleProvider.rejectSchedule(
              scheduleId: notification.entityId!,
            );
          },
        );
      } else {
        NotificationOverlay.show(
          title: notification.title,
          body: notification.body,
          createdAt: notification.createdAt,
        );
      }

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

      await loadAll();

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

import 'dart:convert';

import 'package:estatelqapp/core/services/constants.dart';
import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/features/menu_feature/data/models/notification_model.dart';
import 'package:http/http.dart' as http;

class NotificationRemoteDataSource {
  final http.Client client;

  NotificationRemoteDataSource(this.client);

  String get token => LocalStorageService.getToken() ?? '';

  Map<String, String> get headers => {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token",
  };

  Future<List<AppNotification>> getAllNotifications({bool? isRead}) async {
    String url = "$baseUrl/api/v1/notifications/myNotifications";

    if (isRead != null) {
      url += "?isRead=$isRead";
    }

    final response = await client.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      final List notifications = responseData['data'] ?? [];

      return notifications.map((e) => AppNotification.fromJson(e)).toList();
    }

    throw Exception("Failed to load notifications");
  }

  Future<int> getUnreadCount() async {
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/notifications/countUnRead"),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      return responseData['data'] ?? 0;
    }

    throw Exception("Failed to load unread count");
  }

  Future<void> markAsRead(String notificationId) async {
    final response = await client.patch(
      Uri.parse("$baseUrl/api/v1/notifications/$notificationId/read"),
      headers: headers,
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to mark notification as read");
    }
  }

  Future<void> markAllAsRead() async {
    final response = await client.patch(
      Uri.parse("$baseUrl/api/v1/notifications/readAll"),
      headers: headers,
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to mark all notifications as read");
    }
  }
}

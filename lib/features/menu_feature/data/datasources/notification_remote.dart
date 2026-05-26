import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/notification_model.dart';

class NotificationRemoteDataSource {
  final http.Client client;

  NotificationRemoteDataSource(this.client);

  final String baseUrl = "YOUR_API_URL";

  Future<List<AppNotification>> getAllNotifications() async {
    final response = await client.get(
      Uri.parse("$baseUrl/notifications"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data as List).map((e) => AppNotification.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load notifications");
    }
  }

  Future<List<AppNotification>> getUnreadNotifications() async {
    final response = await client.get(
      Uri.parse("$baseUrl/notifications/unread"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data as List).map((e) => AppNotification.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load unread notifications");
    }
  }

  Future<void> markAsRead(List<String> ids) async {
    final response = await client.post(
      Uri.parse("$baseUrl/notifications/read"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"notificationIds": ids}),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to mark notifications as read");
    }
  }
}

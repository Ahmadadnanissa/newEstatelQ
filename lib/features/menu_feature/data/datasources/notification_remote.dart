import 'package:estatelqapp/features/menu_feature/data/models/notification_model.dart';
import 'package:http/http.dart' as http;

class NotificationRemoteDataSource {
  final http.Client client;

  NotificationRemoteDataSource(this.client);

  Future<List<AppNotification>> getAllNotifications() async {
    return [
      AppNotification(
        id: '0',
        title: 'Mock Notification',
        body: 'Backend not connected yet',
        createdAt: DateTime.now(),
        isRead: false,
        type: 'general',
        image: 'assets/images/clay-banks-79yk4XalXCM-unsplash.jpg',
      ),
    ];
    // try {
    //   final response = await client
    //       .get(Uri.parse('API_URL'))
    //       .timeout(const Duration(seconds: 10));

    //   if (response.statusCode == 200) {
    //     final decoded = jsonDecode(response.body);

    //     if (decoded is List) {
    //       return decoded
    //           .map<AppNotification>((e) => AppNotification.fromJson(e))
    //           .toList();
    //     } else {
    //       throw Exception('Invalid data format (not a list)');
    //     }
    //   } else {
    //     throw Exception('Server error: ${response.statusCode}');
    //   }
    // } on SocketException {
    //   throw Exception('No Internet connection');
    // } on FormatException {
    //   throw Exception('Invalid JSON format');
    // } on HttpException {
    //   throw Exception('HTTP error occurred');
    // } on Exception catch (e) {
    //   throw Exception('Unexpected error: $e');
    // }
  }

  Future<List<AppNotification>> getUnreadNotifications() async {
    return [
      AppNotification(
        id: '0',
        title: 'Mock Notification',
        body: 'Backend not connected yet',
        createdAt: DateTime.now(),
        isRead: false,
        type: 'general',
        image: 'assets/images/clay-banks-79yk4XalXCM-unsplash.jpg',
      ),
    ];
    // try {
    //   final response = await client
    //       .get(Uri.parse('API_URL/unread'))
    //       .timeout(const Duration(seconds: 10));

    //   if (response.statusCode == 200) {
    //     final decoded = jsonDecode(response.body);

    //     if (decoded is List) {
    //       return decoded
    //           .map<AppNotification>((e) => AppNotification.fromJson(e))
    //           .toList();
    //     } else {
    //       throw Exception('Invalid data format (not a list)');
    //     }
    //   } else {
    //     throw Exception('Server error: ${response.statusCode}');
    //   }
    // } on SocketException {
    //   throw Exception('No Internet connection');
    // } on FormatException {
    //   throw Exception('Invalid JSON format');
    // } on HttpException {
    //   throw Exception('HTTP error occurred');
    // } on Exception catch (e) {
    //   throw Exception('Unexpected error: $e');
    // }
  }
}

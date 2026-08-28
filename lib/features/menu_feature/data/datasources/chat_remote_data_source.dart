import 'dart:convert';

import 'package:estatelqapp/features/menu_feature/data/models/chat_message_model1.dart';
import 'package:http/http.dart' as http;

import 'package:estatelqapp/core/services/constants.dart';
import 'package:estatelqapp/core/services/local_storage_service.dart';

import '../models/chat_room_model.dart';
import '../models/deal_chat_room_model.dart';

class ChatRemoteDataSource {
  final http.Client client;

  ChatRemoteDataSource(this.client);

  Future<List<ChatRoomModel>> getChats() async {
    final token = LocalStorageService.getToken();

    if (token == null || token.isEmpty) {
      throw Exception('Authentication token not found');
    }

    final response = await client.get(
      Uri.parse('$baseUrl/api/v1/chat/myDeals'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    final data = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final chats = data['data'];

      if (chats is! List) {
        throw Exception('Invalid chats response');
      }

      return chats
          .map(
            (chat) => ChatRoomModel.fromJson(Map<String, dynamic>.from(chat)),
          )
          .toList();
    }

    throw Exception(data['message'] ?? 'Failed to get chats');
  }

  Future<List<DealChatRoomModel>> getMyDeals() async {
    final token = LocalStorageService.getToken();

    if (token == null || token.isEmpty) {
      throw Exception('Authentication token not found');
    }

    final response = await client.get(
      Uri.parse('$baseUrl/api/v1/chat/myDeals'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    final data = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final deals = data['data'];

      if (deals is! List) {
        throw Exception('Invalid deals response');
      }

      return deals
          .map(
            (deal) =>
                DealChatRoomModel.fromJson(Map<String, dynamic>.from(deal)),
          )
          .toList();
    }

    throw Exception(data['message'] ?? 'Failed to load deal chats');
  }

  Future<List<ChatMessageModel1>> getMessages(String roomId) async {
    final token = LocalStorageService.getToken();

    if (token == null || token.isEmpty) {
      throw Exception('Authentication token not found');
    }

    final response = await client.get(
      Uri.parse('$baseUrl/api/v1/chat/$roomId/messages'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    final data = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final messages = data['data'];

      if (messages is! List) {
        throw Exception('Invalid messages response');
      }

      return messages
          .map(
            (message) =>
                ChatMessageModel1.fromJson(Map<String, dynamic>.from(message)),
          )
          .toList();
    }

    throw Exception(data['message'] ?? 'Failed to get messages');
  }

  Future<ChatMessageModel1> sendMessage(String roomId, String message) async {
    final token = LocalStorageService.getToken();

    if (token == null || token.isEmpty) {
      throw Exception('Authentication token not found');
    }

    final response = await client.post(
      Uri.parse('$baseUrl/api/v1/chat/$roomId/messages'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'message': message}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final messageData = data['data'];

      if (messageData is! Map) {
        throw Exception('Invalid send message response');
      }

      return ChatMessageModel1.fromJson(Map<String, dynamic>.from(messageData));
    }

    throw Exception(data['message'] ?? 'Failed to send message');
  }
}

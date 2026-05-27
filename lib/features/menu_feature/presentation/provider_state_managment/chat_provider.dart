import 'package:estatelqapp/features/menu_feature/data/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:estatelqapp/core/services/socket_service.dart';

class ChatProvider extends ChangeNotifier {
  final SocketService socketService;

  ChatProvider(this.socketService);

  List<ChatMessage> messages = [];
  final TextEditingController controller = TextEditingController();

  String myId = "user_1";
  String chatId = "chat_123";

  void connect() {
    socketService.connect();
    socketService.emit('join_room', chatId);
    socketService.listen('receive_message', (data) {
      final msg = ChatMessage.fromJson(data);
      if (msg.chatId == chatId) {
        messages.add(msg);
        notifyListeners();
      }
    });
  }

  // 📤 send message
  void sendMessage() {
    if (controller.text.trim().isEmpty) return;

    final msg = ChatMessage(
      id: DateTime.now().toString(),
      message: controller.text,
      senderId: myId,
      createdAt: DateTime.now(),
      chatId: chatId,
    );

    // أضف مباشرة للـ UI
    messages.add(msg);
    notifyListeners();

    // ابعت للسيرفر
    socketService.emit('send_message', msg.toJson());

    controller.clear();
  }

  @override
  void dispose() {
    socketService.disconnect();
    controller.dispose();
    super.dispose();
  }
}

import 'package:estatelqapp/features/menu_feature/data/datasources/gemini_service.dart';
import 'package:estatelqapp/features/menu_feature/data/models/chat_message_model.dart';
import 'package:flutter/material.dart';

class ChatWithAiProvider extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();

  final GeminiService _geminiService = GeminiService();

  List<ChatMessageModel> messages = [];

  bool isLoading = false;

  ChatWithAiProvider() {
    // 🔥 مهم جداً: حتى يتحدث الزر لحظياً عند كتابة النص
    controller.addListener(() {
      notifyListeners();
    });
  }

  Future<void> sendMessage() async {
    if (controller.text.trim().isEmpty || isLoading) return;

    String userMessage = controller.text.trim();

    messages.add(ChatMessageModel(message: userMessage, isUser: true));

    controller.clear();

    isLoading = true;
    notifyListeners();

    try {
      final response = await _geminiService.sendMessage(userMessage);

      messages.add(ChatMessageModel(message: response, isUser: false));
    } catch (e) {
      messages.add(ChatMessageModel(message: "Error: $e", isUser: false));
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

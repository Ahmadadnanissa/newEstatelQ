import 'package:estatelqapp/features/menu_feature/data/datasources/gemini_service.dart';
import 'package:estatelqapp/features/menu_feature/data/models/chat_message_model.dart';
import 'package:flutter/material.dart';

class ChatWithAiProvider extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  final GeminiService _geminiService = GeminiService();
  final ScrollController scrollController = ScrollController();

  List<ChatMessageModel> messages = [];
  bool isLoading = false;

  ChatWithAiProvider() {
    controller.addListener(() {
      notifyListeners();
    });
  }

  Future<void> sendMessage() async {
    if (controller.text.trim().isEmpty || isLoading) return;

    String userMessage = controller.text.trim();

    // add user message
    messages.add(ChatMessageModel(message: userMessage, isUser: true));

    controller.clear();
    isLoading = true;
    notifyListeners();

    scrollToBottom();

    try {
      final response = await _geminiService.sendConversation(messages);

      if (response == "NETWORK_ERROR") {
        messages.add(
          ChatMessageModel(
            message: "حدثت مشكلة في الشبكة، حاول لاحقاً",
            isUser: false,
          ),
        );
      } else {
        messages.add(ChatMessageModel(message: response, isUser: false));
      }

      scrollToBottom();
    } catch (_) {
      messages.add(
        ChatMessageModel(
          message: "حدثت مشكلة في الشبكة، حاول لاحقاً",
          isUser: false,
        ),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }
}

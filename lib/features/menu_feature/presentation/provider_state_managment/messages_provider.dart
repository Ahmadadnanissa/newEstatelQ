import 'package:estatelqapp/core/services/chat_socket_service.dart';
import 'package:estatelqapp/features/menu_feature/data/models/chat_message_model1.dart';
import 'package:flutter/foundation.dart';

import '../../domain/usecases/get_messages_use_case.dart';
import '../../domain/usecases/send_message_use_case.dart';

class MessagesProvider extends ChangeNotifier {
  final GetMessagesUseCase getMessagesUseCase;
  final SendMessageUseCase sendMessageUseCase;
  final ChatSocketService chatSocketService;

  MessagesProvider(
    this.getMessagesUseCase,
    this.sendMessageUseCase,
    this.chatSocketService,
  ) {
    chatSocketService.onMessageCreated(_handleMessageCreated);
  }

  bool isLoading = false;
  bool isSending = false;

  String? error;
  String? sendError;

  String? _currentRoomId;

  List<ChatMessageModel1> messages = [];

  Future<void> getMessages(String roomId) async {
    _currentRoomId = roomId;

    isLoading = true;
    error = null;

    notifyListeners();

    try {
      final loadedMessages = await getMessagesUseCase.execute(roomId);
      messages = _uniqueMessagesById(loadedMessages);
    } catch (e) {
      error = e.toString().replaceFirst('Exception: ', '');
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  Future<void> refreshMessages(String roomId) async {
    _currentRoomId = roomId;

    try {
      final loadedMessages = await getMessagesUseCase.execute(roomId);
      final nextMessages = _uniqueMessagesById(loadedMessages);

      if (_hasMessageChanges(nextMessages)) {
        messages = nextMessages;
        error = null;
        notifyListeners();
      }
    } catch (e) {
      if (messages.isEmpty) {
        error = e.toString().replaceFirst('Exception: ', '');
        notifyListeners();
      }
    }
  }

  Future<bool> sendMessage(String roomId, String message) async {
    final trimmedMessage = message.trim();

    if (trimmedMessage.isEmpty) {
      return false;
    }

    isSending = true;
    sendError = null;

    notifyListeners();

    try {
      final sentMessage = await sendMessageUseCase.execute(
        roomId,
        trimmedMessage,
      );

      _addMessage(sentMessage);

      return true;
    } catch (e) {
      sendError = e.toString().replaceFirst('Exception: ', '');

      return false;
    } finally {
      isSending = false;

      notifyListeners();
    }
  }

  void _handleMessageCreated(Map<String, dynamic> data) {
    try {
      final message = ChatMessageModel1.fromJson(data);

      if (_currentRoomId == null) {
        return;
      }

      if (message.roomId != _currentRoomId) {
        return;
      }

      _addMessage(message);

      notifyListeners();
    } catch (e) {
      debugPrint('Chat messageCreated parsing error: $e');
    }
  }

  void clearMessages() {
    messages = [];
    error = null;
    sendError = null;
    _currentRoomId = null;

    notifyListeners();
  }

  void _addMessage(ChatMessageModel1 message) {
    final existingIndex = messages.indexWhere(
      (existingMessage) => existingMessage.id == message.id,
    );

    if (existingIndex == -1) {
      messages.add(message);
    } else {
      messages[existingIndex] = message;
    }

    messages.sort((a, b) => _messageDate(a).compareTo(_messageDate(b)));
  }

  List<ChatMessageModel1> _uniqueMessagesById(
    List<ChatMessageModel1> loadedMessages,
  ) {
    final uniqueMessages = <String, ChatMessageModel1>{};

    for (final message in loadedMessages) {
      final existingMessage = uniqueMessages[message.id];

      if (existingMessage == null ||
          _messageDate(message).isAfter(_messageDate(existingMessage))) {
        uniqueMessages[message.id] = message;
      }
    }

    return uniqueMessages.values.toList()
      ..sort((a, b) => _messageDate(a).compareTo(_messageDate(b)));
  }

  DateTime _messageDate(ChatMessageModel1 message) {
    return DateTime.tryParse(message.createdAt ?? '') ??
        DateTime.fromMillisecondsSinceEpoch(0);
  }

  bool _hasMessageChanges(List<ChatMessageModel1> nextMessages) {
    if (messages.length != nextMessages.length) {
      return true;
    }

    for (var index = 0; index < messages.length; index++) {
      final current = messages[index];
      final next = nextMessages[index];

      if (current.id != next.id ||
          current.message != next.message ||
          current.isEdited != next.isEdited ||
          current.isDeleted != next.isDeleted ||
          current.createdAt != next.createdAt ||
          current.userId != next.userId) {
        return true;
      }
    }

    return false;
  }
}

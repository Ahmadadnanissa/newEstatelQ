import 'package:flutter/foundation.dart';

import '../../data/models/chat_room_model.dart';
import '../../domain/usecases/get_chats_use_case.dart';

class ChatProvider extends ChangeNotifier {
  final GetChatsUseCase getChatsUseCase;

  ChatProvider(this.getChatsUseCase);

  bool isLoading = false;
  String? error;

  List<ChatRoomModel> chats = [];

  Future<void> getChats() async {
    isLoading = true;
    error = null;

    notifyListeners();

    try {
      chats = await getChatsUseCase.execute();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }
}

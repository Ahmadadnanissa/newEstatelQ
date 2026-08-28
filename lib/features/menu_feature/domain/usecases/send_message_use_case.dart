import 'package:estatelqapp/features/menu_feature/data/models/chat_message_model1.dart';

import '../../data/repositories/chat_repository.dart';

class SendMessageUseCase {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  Future<ChatMessageModel1> execute(String roomId, String message) async {
    return await repository.sendMessage(roomId, message);
  }
}

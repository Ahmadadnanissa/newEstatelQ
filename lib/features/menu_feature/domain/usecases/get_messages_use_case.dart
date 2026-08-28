import 'package:estatelqapp/features/menu_feature/data/models/chat_message_model1.dart';

import '../../data/models/chat_message_model.dart';
import '../../data/repositories/chat_repository.dart';

class GetMessagesUseCase {
  final ChatRepository repository;

  GetMessagesUseCase(this.repository);

  Future<List<ChatMessageModel1>> execute(String roomId) async {
    return await repository.getMessages(roomId);
  }
}

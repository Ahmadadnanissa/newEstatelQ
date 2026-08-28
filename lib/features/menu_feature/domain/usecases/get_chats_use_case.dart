import '../../data/models/chat_room_model.dart';
import '../../data/repositories/chat_repository.dart';

class GetChatsUseCase {
  final ChatRepository repository;

  GetChatsUseCase(this.repository);

  Future<List<ChatRoomModel>> execute() async {
    return await repository.getChats();
  }
}

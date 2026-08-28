import '../../data/models/deal_chat_room_model.dart';
import '../../data/repositories/chat_repository.dart';

class GetMyDealsUseCase {
  final ChatRepository repository;

  GetMyDealsUseCase(this.repository);

  Future<List<DealChatRoomModel>> execute() async {
    return await repository.getMyDeals();
  }
}

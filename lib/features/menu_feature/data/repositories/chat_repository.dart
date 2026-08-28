import 'package:estatelqapp/features/menu_feature/data/models/chat_message_model1.dart';

import '../datasources/chat_remote_data_source.dart';
import '../models/chat_room_model.dart';
import '../models/deal_chat_room_model.dart';

class ChatRepository {
  final ChatRemoteDataSource remote;

  ChatRepository(this.remote);

  Future<List<ChatRoomModel>> getChats() async {
    return await remote.getChats();
  }

  Future<List<DealChatRoomModel>> getMyDeals() async {
    return await remote.getMyDeals();
  }

  Future<List<ChatMessageModel1>> getMessages(String roomId) async {
    return await remote.getMessages(roomId);
  }

  Future<ChatMessageModel1> sendMessage(String roomId, String message) async {
    return await remote.sendMessage(roomId, message);
  }
}

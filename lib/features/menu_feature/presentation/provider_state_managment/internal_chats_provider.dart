import 'package:flutter/foundation.dart';

import '../../data/models/chat_room_model.dart';
import '../../domain/usecases/get_chats_use_case.dart';

class InternalChatsProvider extends ChangeNotifier {
  final GetChatsUseCase getChatsUseCase;

  InternalChatsProvider(this.getChatsUseCase);

  bool isLoading = false;
  String? error;

  List<ChatRoomModel> chats = [];

  Future<void> getChats() async {
    isLoading = true;
    error = null;

    notifyListeners();

    try {
      final loadedChats = await getChatsUseCase.execute();
      chats = _uniqueChatsByDealId(loadedChats);
    } catch (e) {
      error = e.toString().replaceFirst('Exception: ', '');
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  List<ChatRoomModel> _uniqueChatsByDealId(List<ChatRoomModel> loadedChats) {
    final uniqueChats = <String, ChatRoomModel>{};

    for (final chat in loadedChats) {
      final dealKey = _dealKey(chat);
      final existingChat = uniqueChats[dealKey];

      if (existingChat == null || _isNewer(chat, existingChat)) {
        uniqueChats[dealKey] = chat;
      }
    }

    return uniqueChats.values.toList()
      ..sort((a, b) => _roomDate(b).compareTo(_roomDate(a)));
  }

  bool _isNewer(ChatRoomModel chat, ChatRoomModel existingChat) {
    return _roomDate(chat).isAfter(_roomDate(existingChat));
  }

  DateTime _roomDate(ChatRoomModel chat) {
    return DateTime.tryParse(chat.updatedAt ?? chat.createdAt ?? '') ??
        DateTime.fromMillisecondsSinceEpoch(0);
  }

  String _dealKey(ChatRoomModel chat) {
    final rootDealId = _firstNonEmpty([
      chat.dealId,
      chat.buyRentDealId,
      chat.saleLeaseDealId,
    ]);
    if (rootDealId != null) {
      return 'deal:$rootDealId';
    }

    final buyRentDealId = _idFromDealData(chat.buyRentDeal);
    if (buyRentDealId != null) {
      return 'buyRentDeal:$buyRentDealId';
    }

    final saleLeaseDealId = _idFromDealData(chat.saleLeaseDeal);
    if (saleLeaseDealId != null) {
      return 'saleLeaseDeal:$saleLeaseDealId';
    }

    final visibleDealKey = _firstNonEmpty([
      _visibleDealKey(
        type: chat.type,
        name: chat.name,
        description: chat.description,
      ),
      _normalizedVisibleValue(chat.name),
    ]);
    if (visibleDealKey != null) {
      return 'visibleDeal:$visibleDealKey';
    }

    final membersKey = _membersKey(chat.roomMembers);
    if (membersKey != null) {
      return 'members:$membersKey';
    }

    return 'room:${chat.id}';
  }

  String? _idFromDealData(dynamic dealData, [int depth = 0]) {
    if (dealData == null || depth > 4) {
      return null;
    }

    if (dealData is String || dealData is num) {
      return _normalValue(dealData.toString());
    }

    if (dealData is Map) {
      final directId = _firstNonEmpty([
        dealData['id']?.toString(),
        dealData['_id']?.toString(),
        dealData['dealId']?.toString(),
        dealData['buyRentDealId']?.toString(),
        dealData['saleLeaseDealId']?.toString(),
      ]);

      if (directId != null) {
        return directId;
      }

      for (final value in dealData.values) {
        final nestedId = _idFromDealData(value, depth + 1);
        if (nestedId != null) {
          return nestedId;
        }
      }
    }

    if (dealData is Iterable) {
      for (final value in dealData) {
        final nestedId = _idFromDealData(value, depth + 1);
        if (nestedId != null) {
          return nestedId;
        }
      }
    }

    return null;
  }

  String? _firstNonEmpty(List<String?> values) {
    for (final value in values) {
      final normalValue = _normalValue(value);
      if (normalValue != null) {
        return normalValue;
      }
    }

    return null;
  }

  String? _normalValue(String? value) {
    final normalValue = value?.trim();
    return normalValue == null || normalValue.isEmpty ? null : normalValue;
  }

  String? _visibleDealKey({
    required String? type,
    required String? name,
    required String? description,
  }) {
    final parts = [
      _normalizedVisibleValue(type),
      _normalizedVisibleValue(name),
      _normalizedVisibleValue(description),
    ].whereType<String>().toList();

    if (parts.isEmpty) {
      return null;
    }

    return parts.join('|');
  }

  String? _normalizedVisibleValue(String? value) {
    final normalizedValue = value?.trim().toLowerCase().replaceAll(
      RegExp(r'\s+'),
      ' ',
    );

    return normalizedValue == null || normalizedValue.isEmpty
        ? null
        : normalizedValue;
  }

  String? _membersKey(List<dynamic> members) {
    final memberIds =
        members.map(_idFromMemberData).whereType<String>().toSet().toList()
          ..sort();

    if (memberIds.isEmpty) {
      return null;
    }

    return memberIds.join('|');
  }

  String? _idFromMemberData(dynamic memberData) {
    if (memberData == null) {
      return null;
    }

    if (memberData is String || memberData is num) {
      return _normalValue(memberData.toString());
    }

    if (memberData is Map) {
      return _firstNonEmpty([
            memberData['id']?.toString(),
            memberData['_id']?.toString(),
            memberData['userId']?.toString(),
            memberData['clientId']?.toString(),
            memberData['employeeId']?.toString(),
            memberData['memberId']?.toString(),
          ]) ??
          _idFromMemberData(memberData['user']) ??
          _idFromMemberData(memberData['client']) ??
          _idFromMemberData(memberData['employee']);
    }

    return null;
  }
}

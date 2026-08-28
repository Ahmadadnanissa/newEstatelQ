import 'package:flutter/material.dart';

import '../../data/models/deal_chat_room_model.dart';
import '../../domain/usecases/get_my_deals_use_case.dart';

class MyDealsProvider extends ChangeNotifier {
  final GetMyDealsUseCase getMyDealsUseCase;

  MyDealsProvider(this.getMyDealsUseCase);

  bool isLoading = false;
  String? error;

  List<DealChatRoomModel> deals = [];

  Future<void> getMyDeals() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final loadedDeals = await getMyDealsUseCase.execute();
      deals = _uniqueDealsByDealId(loadedDeals);
    } catch (e) {
      error = e.toString().replaceFirst('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  List<DealChatRoomModel> _uniqueDealsByDealId(
    List<DealChatRoomModel> loadedDeals,
  ) {
    final uniqueDeals = <String, DealChatRoomModel>{};

    for (final deal in loadedDeals) {
      final dealKey = _dealKey(deal);
      final existingDeal = uniqueDeals[dealKey];

      if (existingDeal == null || _isNewer(deal, existingDeal)) {
        uniqueDeals[dealKey] = deal;
      }
    }

    return uniqueDeals.values.toList()
      ..sort((a, b) => _roomDate(b).compareTo(_roomDate(a)));
  }

  bool _isNewer(DealChatRoomModel deal, DealChatRoomModel existingDeal) {
    return _roomDate(deal).isAfter(_roomDate(existingDeal));
  }

  DateTime _roomDate(DealChatRoomModel deal) {
    return DateTime.tryParse(deal.updatedAt ?? deal.createdAt ?? '') ??
        DateTime.fromMillisecondsSinceEpoch(0);
  }

  String _dealKey(DealChatRoomModel deal) {
    final rootDealId = _firstNonEmpty([
      deal.dealId,
      deal.buyRentDealId,
      deal.saleLeaseDealId,
    ]);
    if (rootDealId != null) {
      return 'deal:$rootDealId';
    }

    final buyRentDealId = _idFromDealData(deal.buyRentDeal);
    if (buyRentDealId != null) {
      return 'buyRentDeal:$buyRentDealId';
    }

    final saleLeaseDealId = _idFromDealData(deal.saleLeaseDeal);
    if (saleLeaseDealId != null) {
      return 'saleLeaseDeal:$saleLeaseDealId';
    }

    final visibleDealKey = _firstNonEmpty([
      _visibleDealKey(
        type: deal.type,
        name: deal.name,
        description: deal.description,
      ),
      _normalizedVisibleValue(deal.name),
    ]);
    if (visibleDealKey != null) {
      return 'visibleDeal:$visibleDealKey';
    }

    final membersKey = _membersKey(deal.roomMembers);
    if (membersKey != null) {
      return 'members:$membersKey';
    }

    return 'room:${deal.id}';
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

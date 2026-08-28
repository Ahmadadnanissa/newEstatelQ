class ChatRoomModel {
  final String id;
  final String? name;
  final String? image;
  final String? description;
  final String? type;
  final String? ownerId;
  final String? createdAt;
  final String? updatedAt;
  final String? dealId;
  final String? buyRentDealId;
  final String? saleLeaseDealId;
  final dynamic buyRentDeal;
  final dynamic saleLeaseDeal;
  final List<dynamic> roomMembers;

  ChatRoomModel({
    required this.id,
    this.name,
    this.image,
    this.description,
    this.type,
    this.ownerId,
    this.createdAt,
    this.updatedAt,
    this.dealId,
    this.buyRentDealId,
    this.saleLeaseDealId,
    this.buyRentDeal,
    this.saleLeaseDeal,
    required this.roomMembers,
  });

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) {
    return ChatRoomModel(
      id: json['id'].toString(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      ownerId: json['ownerId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      dealId: json['dealId']?.toString(),
      buyRentDealId: json['buyRentDealId']?.toString(),
      saleLeaseDealId: json['saleLeaseDealId']?.toString(),
      buyRentDeal: json['buyRentDeal'],
      saleLeaseDeal: json['saleLeaseDeal'],
      roomMembers: json['roomMembers'] ?? [],
    );
  }
}

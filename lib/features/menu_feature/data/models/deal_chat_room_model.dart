class DealChatRoomModel {
  final String id;
  final String? name;
  final String? image;
  final String? description;
  final String? type;
  final String? createdAt;
  final String? updatedAt;
  final String? dealId;
  final String? buyRentDealId;
  final String? saleLeaseDealId;

  final dynamic buyRentDeal;
  final dynamic saleLeaseDeal;
  final List<dynamic> roomMembers;
  final List<dynamic> messages;

  DealChatRoomModel({
    required this.id,
    this.name,
    this.image,
    this.description,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.dealId,
    this.buyRentDealId,
    this.saleLeaseDealId,
    this.buyRentDeal,
    this.saleLeaseDeal,
    required this.roomMembers,
    required this.messages,
  });

  factory DealChatRoomModel.fromJson(Map<String, dynamic> json) {
    return DealChatRoomModel(
      id: json["id"].toString(),
      name: json["name"],
      image: json["image"],
      description: json["description"],
      type: json["type"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      dealId: json["dealId"]?.toString(),
      buyRentDealId: json["buyRentDealId"]?.toString(),
      saleLeaseDealId: json["saleLeaseDealId"]?.toString(),
      buyRentDeal: json["buyRentDeal"],
      saleLeaseDeal: json["saleLeaseDeal"],
      roomMembers: json["roomMembers"] ?? [],
      messages: json["messages"] ?? [],
    );
  }
}

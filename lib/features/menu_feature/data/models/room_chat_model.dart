class RoomChatModel {
  final String id;
  final String title;
  final String body;
  final String? image;
  final int unreadCount;

  RoomChatModel({
    required this.id,
    required this.title,
    required this.body,
    this.image,
    this.unreadCount = 0,
  });

  factory RoomChatModel.fromJson(Map<String, dynamic> json) {
    return RoomChatModel(
      id: json['id'].toString(),
      title: json['title'] ?? "",
      body: json['body'] ?? "",
      image: json['image'],
      unreadCount: json['unreadCount'] ?? 0,
    );
  }
}

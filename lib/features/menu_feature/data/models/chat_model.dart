class ChatMessage {
  final String id;
  final String message;
  final String senderId;
  final DateTime createdAt;
  final String chatId;
  ChatMessage({
    required this.id,
    required this.message,
    required this.senderId,
    required this.createdAt,
    required this.chatId,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'].toString(),
      message: json['message'],
      senderId: json['senderId'],
      createdAt: DateTime.parse(json['createdAt']),
      chatId: json['chatId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'senderId': senderId,
      'createdAt': createdAt.toIso8601String(),
      'chatId': chatId,
    };
  }
}

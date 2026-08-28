class ChatMessageModel1 {
  final String id;
  final String? message;
  final bool isEdited;
  final bool isDeleted;
  final String? createdAt;
  final String? userId;
  final String? roomId;
  final Map<String, dynamic>? user;

  ChatMessageModel1({
    required this.id,
    this.message,
    required this.isEdited,
    required this.isDeleted,
    this.createdAt,
    this.userId,
    this.roomId,
    this.user,
  });

  factory ChatMessageModel1.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel1(
      id: json['id'].toString(),
      message: json['message'] as String?,
      isEdited: json['isEdited'] == true,
      isDeleted: json['isDeleted'] == true,
      createdAt: json['createdAt'] as String?,
      userId: json['userId']?.toString(),
      roomId: json['roomId']?.toString(),
      user: json['user'] is Map
          ? Map<String, dynamic>.from(json['user'])
          : null,
    );
  }
}

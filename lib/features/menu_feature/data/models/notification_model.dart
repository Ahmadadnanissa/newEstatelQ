class AppNotification {
  final String id;
  final String title;
  final String body;
  final String? image;
  final DateTime createdAt;
  bool isRead;
  final String? entityId;
  final String type;

  AppNotification({
    required this.id,
    required this.title,
    required this.body,
    this.image,
    required this.createdAt,
    this.isRead = false,
    this.entityId,
    required this.type,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['id'].toString(),
      title: json['title'],
      body: json['body'],
      image: json['image'],
      createdAt: DateTime.parse(json['createdAt']),
      isRead: json['isRead'] ?? false,
      entityId: json['entityId'],
      type: json['type'] ?? 'general',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'image': image,
      'createdAt': createdAt.toIso8601String(),
      'isRead': isRead,
      'entityId': entityId,
      'type': type,
    };
  }
}

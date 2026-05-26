class AppNotification {
  final String id;
  final String title;
  final String body;
  final String? image;
  final DateTime createdAt;
  final bool isRead;
  final String? entityId;
  final String type;

  AppNotification({
    required this.id,
    required this.title,
    required this.body,
    this.image,
    required this.createdAt,
    required this.isRead,
    this.entityId,
    required this.type,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['id'].toString(),
      title: json['title'] ?? "",
      body: json['body'] ?? "",
      image: json['image'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      isRead: json['isRead'] ?? false,
      entityId: json['entityId']?.toString(),
      type: json['type'] ?? 'general',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "body": body,
      "image": image,
      "createdAt": createdAt.toIso8601String(),
      "isRead": isRead,
      "entityId": entityId,
      "type": type,
    };
  }
}

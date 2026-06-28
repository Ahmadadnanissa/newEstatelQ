class AppNotification {
  final String id;
  final String title;
  final String body;
  final DateTime createdAt;

  final bool? isRead;

  final String? entityId;
  final String? entityType;

  final Map<String, dynamic>? data;

  AppNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    this.isRead,
    this.entityId,
    this.entityType,
    this.data,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      isRead: json['isRead'],
      entityId: json['entityId']?.toString(),
      entityType: json['entityType']?.toString(),
      data: json['data'] != null
          ? Map<String, dynamic>.from(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "body": body,
      "createdAt": createdAt.toIso8601String(),
      "isRead": isRead,
      "entityId": entityId,
      "entityType": entityType,
      "data": data,
    };
  }
}

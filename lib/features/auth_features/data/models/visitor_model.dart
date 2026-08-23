class VisitorModel {
  final String id;
  final String createdAt;
  final String lastActiveAt;
  final bool isLead;
  final String ip;

  VisitorModel({
    required this.id,
    required this.createdAt,
    required this.lastActiveAt,
    required this.isLead,
    required this.ip,
  });

  factory VisitorModel.fromJson(Map<String, dynamic> json) {
    return VisitorModel(
      id: json['id'],
      createdAt: json['createdAt'],
      lastActiveAt: json['lastActiveAt'],
      isLead: json['islead'] ?? false,
      ip: json['ip'] ?? '',
    );
  }
}

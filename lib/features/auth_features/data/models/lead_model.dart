class LeadModel {
  final String id;
  final String createdAt;
  final String lastActiveAt;
  final bool isLead;
  final String ip;

  LeadModel({
    required this.id,
    required this.createdAt,
    required this.lastActiveAt,
    required this.isLead,
    required this.ip,
  });

  factory LeadModel.fromJson(Map<String, dynamic> json) {
    return LeadModel(
      id: json['id'],
      createdAt: json['createdAt'],
      lastActiveAt: json['lastActiveAt'],
      isLead: json['islead'] ?? false,
      ip: json['ip'] ?? '',
    );
  }
}

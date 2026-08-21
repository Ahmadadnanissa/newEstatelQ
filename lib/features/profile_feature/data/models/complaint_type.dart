class ComplaintType {
  final String id;
  final String name;
  final String code;

  ComplaintType({required this.id, required this.name, required this.code});

  factory ComplaintType.fromJson(Map<String, dynamic> json) {
    return ComplaintType(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      code: json['code']?.toString() ?? '',
    );
  }
}

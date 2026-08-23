class UpdateLeadModel {
  final String message;

  UpdateLeadModel({required this.message});

  factory UpdateLeadModel.fromJson(Map<String, dynamic> json) {
    return UpdateLeadModel(message: json['message'] ?? '');
  }
}

class ScheduleActionModel {
  final String status;
  final String message;

  ScheduleActionModel({required this.status, required this.message});

  factory ScheduleActionModel.fromJson(Map<String, dynamic> json) {
    return ScheduleActionModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
    );
  }
}

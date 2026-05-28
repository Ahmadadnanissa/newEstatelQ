class ForgotPasswordResponseModel {
  final String status;
  final String message;

  ForgotPasswordResponseModel({required this.status, required this.message});

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponseModel(
      status: json['status'],
      message: json['message'],
    );
  }
}

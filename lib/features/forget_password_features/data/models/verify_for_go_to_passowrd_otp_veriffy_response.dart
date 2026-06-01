class VerifyForgotPasswordOtpModel {
  final String status;
  final String message;
  final String token;

  VerifyForgotPasswordOtpModel({
    required this.status,
    required this.message,
    required this.token,
  });

  factory VerifyForgotPasswordOtpModel.fromJson(Map<String, dynamic> json) {
    return VerifyForgotPasswordOtpModel(
      status: json['status'],
      message: json['message'],
      token: json['token'],
    );
  }
}

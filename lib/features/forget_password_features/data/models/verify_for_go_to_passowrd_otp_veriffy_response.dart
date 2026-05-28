class VerifyForgotPasswordOtpModel {
  final String status;
  final String message;
  final String resetToken;

  VerifyForgotPasswordOtpModel({
    required this.message,
    required this.status,
    required this.resetToken,
  });

  factory VerifyForgotPasswordOtpModel.fromJson(Map<String, dynamic> json) {
    return VerifyForgotPasswordOtpModel(
      status: json['status'],
      message: json['message'],
      resetToken: json['resetToken'],
    );
  }
}

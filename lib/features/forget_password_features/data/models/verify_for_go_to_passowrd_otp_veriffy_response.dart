class VerifyForgotPasswordOtpModel {
  final String status;
  final String resetToken;

  VerifyForgotPasswordOtpModel({
    required this.status,
    required this.resetToken,
  });

  factory VerifyForgotPasswordOtpModel.fromJson(Map<String, dynamic> json) {
    return VerifyForgotPasswordOtpModel(
      status: json['status'],
      resetToken: json['resetToken'],
    );
  }
}

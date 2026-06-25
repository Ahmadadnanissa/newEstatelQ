class OtpResponceModel {
  final String status;
  final String token;
  final String? message;

  final String id;
  final String name;
  final String email;
  final bool isActive;
  final String role;
  final bool otpVerified;

  OtpResponceModel({
    required this.status,
    required this.token,
    this.message,
    required this.id,
    required this.name,
    required this.email,
    required this.isActive,
    required this.role,
    required this.otpVerified,
  });

  factory OtpResponceModel.fromJson(Map<String, dynamic> json) {
    return OtpResponceModel(
      status: json["status"],
      token: json["token"],
      message: json["message"],

      id: json["data"]["id"],
      name: json["data"]["name"],
      email: json["data"]["email"],
      isActive: json["data"]["isActive"],
      role: json["data"]["role"],
      otpVerified: json["data"]["otpVerified"],
    );
  }
}

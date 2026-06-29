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
    final data = json["data"] ?? {};
    return OtpResponceModel(
      status: json["status"] ?? "",
      token: json["token"] ?? "",
      message: json["message"],
      id: data["id"] ?? "",
      name: data["name"] ?? "",
      email: data["email"] ?? "",
      isActive: data["isActive"] ?? false,
      role: data["role"] ?? "",
      otpVerified: data["otpVerified"] ?? false,
    );
  }
}

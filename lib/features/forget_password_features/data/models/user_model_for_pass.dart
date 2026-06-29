class UserModelForPass {
  final String id;
  final String name;
  final String email;
  final bool isActive;
  final String role;
  final bool otpVerified;

  UserModelForPass({
    required this.id,
    required this.name,
    required this.email,
    required this.isActive,
    required this.role,
    required this.otpVerified,
  });

  factory UserModelForPass.fromJson(Map<String, dynamic> json) {
    return UserModelForPass(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      isActive: json['isActive'] ?? false,
      role: json['role'] ?? '',
      otpVerified: json['otpVerified'] ?? false,
    );
  }
}

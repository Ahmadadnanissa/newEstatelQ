class UserModel {
  final String id;
  final String name;
  final String email;
  final bool isActive;
  final String role;
  final bool otpVerified;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.isActive,
    required this.role,
    required this.otpVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      isActive: json['isActive'],
      role: json['role'],
      otpVerified: json['otpVerified'],
    );
  }
}

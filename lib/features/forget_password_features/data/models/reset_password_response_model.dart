import 'package:estatelqapp/features/forget_password_features/data/models/user_model_for_pass.dart';

class ResetPasswordResponseModel {
  final String status;
  final String token;
  final UserModelForPass user;

  ResetPasswordResponseModel({
    required this.status,
    required this.token,
    required this.user,
  });

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    if (json["data"] == null) {
      throw Exception("Invalid response structure");
    }

    return ResetPasswordResponseModel(
      status: json["status"] ?? "",
      token: json["token"] ?? "",
      user: UserModelForPass.fromJson(json["data"]),
    );
  }
}

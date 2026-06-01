import 'package:estatelqapp/features/auth_features/data/models/user_model.dart';

class ResetPasswordResponseModel {
  final String status;
  final String token;
  final UserModel user;

  ResetPasswordResponseModel({
    required this.status,
    required this.token,
    required this.user,
  });

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponseModel(
      status: json["status"],
      token: json["token"],
      user: UserModel.fromJson(json["data"]),
    );
  }
}

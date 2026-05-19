class SignupResponseModel {
  final String status;

  final String message;

  SignupResponseModel({required this.status, required this.message});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      status: json["status"],
      message: json["message"],
    );
  }
}

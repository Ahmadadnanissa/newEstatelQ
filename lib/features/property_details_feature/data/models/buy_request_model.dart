class BuyRequestModel {
  final String status;
  final String message;

  BuyRequestModel({required this.status, required this.message});

  factory BuyRequestModel.fromJson(Map<String, dynamic> json) {
    return BuyRequestModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
    );
  }
}

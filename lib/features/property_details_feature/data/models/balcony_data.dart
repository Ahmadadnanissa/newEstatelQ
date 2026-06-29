class BalconyData {
  final double sizeSqft;

  const BalconyData({required this.sizeSqft});

  Map<String, dynamic> toJson() {
    return {'size_sqft': sizeSqft};
  }

  factory BalconyData.fromJson(Map<String, dynamic> json) {
    return BalconyData(sizeSqft: (json['size_sqft'] as num?)?.toDouble() ?? 0);
  }
}

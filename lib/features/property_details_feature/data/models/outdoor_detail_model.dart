class OutdoorDetail {
  final String title;
  final String description;
  final String value;
  final List<String> images;

  OutdoorDetail({
    required this.title,
    required this.description,
    required this.value,
    required this.images,
  });

  factory OutdoorDetail.fromJson(Map<String, dynamic> json) {
    return OutdoorDetail(
      title: json['title'],
      description: json['description'],
      value: json['value'],
      images: List<String>.from(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'value': value,
      'images': images,
    };
  }
}

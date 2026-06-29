class OutdoorItem {
  final String type;
  final dynamic desc;
  final List<String> photos;

  OutdoorItem({required this.type, required this.desc, required this.photos});

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "data": {"desc": desc},
      "photos": photos,
    };
  }

  factory OutdoorItem.fromJson(Map<String, dynamic> json) {
    return OutdoorItem(
      type: json['type'] ?? '',
      desc: json['data']?['spec'],
      photos: List<String>.from(json['photos'] ?? []),
    );
  }
}

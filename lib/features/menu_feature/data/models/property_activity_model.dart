import 'package:estatelqapp/features/menu_feature/domain/entity/property_activity.dart';

class PropertyActivityModel extends PropertyActivity {
  PropertyActivityModel({
    required super.title,
    required super.description,
    required super.date,
    required super.status,
  });

  factory PropertyActivityModel.fromJson(Map<String, dynamic> json) {
    return PropertyActivityModel(
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      status: json['status'],
    );
  }
}

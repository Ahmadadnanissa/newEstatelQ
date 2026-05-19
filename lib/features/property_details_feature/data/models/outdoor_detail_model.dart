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











// class OutdoorItemModel {

//  final String id;

//  final String type;

//  final Map<String,dynamic>? data;

//  final String? description;

//  final List<String> photos;


//  OutdoorItemModel({

//    required this.id,
//    required this.type,
//    this.data,
//    this.description,
//    required this.photos

//  });


//  factory OutdoorItemModel.fromJson(
//      Map<String,dynamic> json){

//    return OutdoorItemModel(

//       id: json["id"],

//       type: json["type"],

//       data: json["data"],

//       description:
//       json["description"],

//       photos:
//       List<String>.from(
//       json["photos"]??[])

//    );

//  }

// }
import 'dart:convert';

import 'package:estatelqapp/core/services/constants.dart';
import 'package:estatelqapp/features/auth_features/data/models/visitor_model.dart';
import 'package:http/http.dart' as http;

class VisitorRemoteDataSource {
  Future<VisitorModel> createVisitor() async {
    final response = await http.post(
      Uri.parse("$baseUrl/api/v1/visitors"),
      headers: {"Content-Type": "application/json"},
    );

    print(response.statusCode);
    print(response.body);

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return VisitorModel.fromJson(data["data"]);
    }

    throw Exception(data["message"] ?? "Failed to create visitor");
  }
}

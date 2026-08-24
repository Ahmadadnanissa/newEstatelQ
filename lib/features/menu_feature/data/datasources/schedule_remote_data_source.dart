import 'dart:convert';

import 'package:estatelqapp/core/services/constants.dart';
import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:http/http.dart' as http;

import '../models/schedule_action_model.dart';

class ScheduleRemoteDataSource {
  Future<ScheduleActionModel> acceptSchedule({
    required String scheduleId,
  }) async {
    final token = LocalStorageService.getToken();

    final response = await http.patch(
      Uri.parse("$baseUrl/api/v1/schedules/$scheduleId/accept"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ScheduleActionModel.fromJson(data);
    }

    throw Exception(data["message"] ?? "Failed to accept schedule");
  }

  Future<ScheduleActionModel> rejectSchedule({
    required String scheduleId,
  }) async {
    final token = LocalStorageService.getToken();

    final response = await http.patch(
      Uri.parse("$baseUrl/api/v1/schedules/$scheduleId/reject"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ScheduleActionModel.fromJson(data);
    }

    throw Exception(data["message"] ?? "Failed to reject schedule");
  }
}

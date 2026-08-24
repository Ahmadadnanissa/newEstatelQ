import '../datasources/schedule_remote_data_source.dart';
import '../models/schedule_action_model.dart';

class ScheduleRepository {
  final ScheduleRemoteDataSource remote;

  ScheduleRepository(this.remote);

  Future<ScheduleActionModel> acceptSchedule({
    required String scheduleId,
  }) async {
    return await remote.acceptSchedule(scheduleId: scheduleId);
  }

  Future<ScheduleActionModel> rejectSchedule({
    required String scheduleId,
  }) async {
    return await remote.rejectSchedule(scheduleId: scheduleId);
  }
}

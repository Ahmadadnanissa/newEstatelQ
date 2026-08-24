import '../../data/repositories/schedule_repository.dart';
import '../../data/models/schedule_action_model.dart';

class RejectScheduleUseCase {
  final ScheduleRepository repository;

  RejectScheduleUseCase(this.repository);

  Future<ScheduleActionModel> execute({required String scheduleId}) async {
    return await repository.rejectSchedule(scheduleId: scheduleId);
  }
}

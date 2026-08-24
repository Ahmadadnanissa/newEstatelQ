import '../../data/repositories/schedule_repository.dart';
import '../../data/models/schedule_action_model.dart';

class AcceptScheduleUseCase {
  final ScheduleRepository repository;

  AcceptScheduleUseCase(this.repository);

  Future<ScheduleActionModel> execute({required String scheduleId}) async {
    return await repository.acceptSchedule(scheduleId: scheduleId);
  }
}

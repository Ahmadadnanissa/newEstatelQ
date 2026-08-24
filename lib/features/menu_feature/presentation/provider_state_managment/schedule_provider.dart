import 'package:flutter/foundation.dart';

import '../../data/models/schedule_action_model.dart';
import '../../domain/usecases/accept_schedule_use_case.dart';
import '../../domain/usecases/reject_schedule_use_case.dart';

class ScheduleProvider extends ChangeNotifier {
  final AcceptScheduleUseCase acceptScheduleUseCase;
  final RejectScheduleUseCase rejectScheduleUseCase;

  ScheduleProvider(this.acceptScheduleUseCase, this.rejectScheduleUseCase);

  bool isLoading = false;
  String? error;

  ScheduleActionModel? actionResult;

  Future<void> acceptSchedule({required String scheduleId}) async {
    try {
      error = null;
      isLoading = true;

      notifyListeners();

      actionResult = await acceptScheduleUseCase.execute(
        scheduleId: scheduleId,
      );
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;

    notifyListeners();
  }

  Future<void> rejectSchedule({required String scheduleId}) async {
    try {
      error = null;
      isLoading = true;

      notifyListeners();

      actionResult = await rejectScheduleUseCase.execute(
        scheduleId: scheduleId,
      );
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;

    notifyListeners();
  }
}

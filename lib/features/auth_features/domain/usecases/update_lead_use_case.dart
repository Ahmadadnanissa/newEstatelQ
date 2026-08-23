import 'package:estatelqapp/features/lead_update_feature/data/models/update_lead_model.dart';
import 'package:estatelqapp/features/lead_update_feature/data/repositories/update_lead_repository.dart';

class UpdateLeadUseCase {
  final UpdateLeadRepository repository;

  UpdateLeadUseCase(this.repository);

  Future<UpdateLeadModel> execute({
    required String visitorSessionId,
    required String source,
    required double budget,
  }) async {
    return await repository.updateLead(
      visitorSessionId: visitorSessionId,
      source: source,
      budget: budget,
    );
  }
}
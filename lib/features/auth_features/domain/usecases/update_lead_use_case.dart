import 'package:estatelqapp/features/auth_features/data/models/update_lead_model.dart';
import 'package:estatelqapp/features/auth_features/data/repositories/update_lead_repository.dart';

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

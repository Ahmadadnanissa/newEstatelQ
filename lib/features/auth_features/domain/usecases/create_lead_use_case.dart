import 'package:estatelqapp/features/auth_features/data/models/lead_model.dart';
import 'package:estatelqapp/features/auth_features/data/repositories/lead_repository.dart';

class CreateLeadUseCase {
  final LeadRepository repository;
  CreateLeadUseCase(this.repository);
  Future<LeadModel> execute(String visitorSessionId) async {
    return await repository.createLead(visitorSessionId);
  }
}

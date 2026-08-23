import 'package:estatelqapp/features/auth_features/data/datasources/update_lead_remote_data_source.dart';
import 'package:estatelqapp/features/auth_features/data/models/update_lead_model.dart';

class UpdateLeadRepository {
  final UpdateLeadRemoteDataSource remote;

  UpdateLeadRepository(this.remote);

  Future<UpdateLeadModel> updateLead({
    required String visitorSessionId,
    required String source,
    required double budget,
  }) async {
    return await remote.updateLead(
      visitorSessionId: visitorSessionId,
      source: source,
      budget: budget,
    );
  }
}

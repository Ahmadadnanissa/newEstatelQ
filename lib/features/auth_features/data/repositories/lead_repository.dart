import 'package:estatelqapp/features/auth_features/data/datasources/lead_remote_dat_source.dart';
import 'package:estatelqapp/features/auth_features/data/models/lead_model.dart';

class LeadRepository {
  final LeadRemoteDataSource remote;

  LeadRepository(this.remote);

  Future<LeadModel> createLead(String visitorSessionId) async {
    return await remote.createLead(visitorSessionId);
  }
}

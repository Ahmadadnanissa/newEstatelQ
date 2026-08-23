import 'package:estatelqapp/features/auth_features/data/datasources/visitor_remote_data_source.dart';
import 'package:estatelqapp/features/auth_features/data/models/visitor_model.dart';

class VisitorRepository {
  final VisitorRemoteDataSource remote;

  VisitorRepository(this.remote);

  Future<VisitorModel> createVisitor({required String ip}) async {
    return await remote.createVisitor(ip: ip);
  }
}

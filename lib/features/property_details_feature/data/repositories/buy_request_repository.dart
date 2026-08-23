import 'package:estatelqapp/features/property_details_feature/data/datasources/buy_request_remote_data_source.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/buy_request_model.dart';

class BuyRequestRepository {
  final BuyRequestRemoteDataSource remote;

  BuyRequestRepository(this.remote);

  Future<BuyRequestModel> createBuyRequest({
    required String type,
    String? message,
    required String propertyId,
  }) async {
    return await remote.createBuyRequest(
      type: type,
      message: message,
      propertyId: propertyId,
    );
  }
}

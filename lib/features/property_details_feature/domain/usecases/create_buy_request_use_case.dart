import 'package:estatelqapp/features/property_details_feature/data/models/buy_request_model.dart';
import 'package:estatelqapp/features/property_details_feature/data/repositories/buy_request_repository.dart';

class CreateBuyRequestUseCase {
  final BuyRequestRepository repository;

  CreateBuyRequestUseCase(this.repository);

  Future<BuyRequestModel> execute({
    required String type,
    String? message,
    required String propertyId,
  }) async {
    return await repository.createBuyRequest(
      type: type,
      message: message,
      propertyId: propertyId,
    );
  }
}

import 'package:estatelqapp/features/menu_feature/data/models/property_activity_model.dart';

class PropertyStatusRemoteDataSource {
  Future<List<PropertyActivityModel>> getActivities(String propertyId) async {
    final response = [
      {
        "title": "Deal Started",
        "description":
            "Your property has been listed and is now visible to potential buyers",
        "date": "2026-04-20",
        "status": "started",
      },
      {
        "title": "Price Negotiation",
        "description":
            "A buyer is currently negotiating the price of your property",
        "date": "2026-04-21",
        "status": "pending",
      },
      {
        "title": "Deal Failed",
        "description":
            "The buyer rejected the final price offer and the deal was cancelled",
        "date": "2026-04-22",
        "status": "failed",
      },
      {
        "title": "Deal Successful",
        "description":
            "Congratulations! The property has been successfully sold",
        "date": "2026-04-23",
        "status": "success",
      },
    ];

    return response.map((e) => PropertyActivityModel.fromJson(e)).toList();
  }
}

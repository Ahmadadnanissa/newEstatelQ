import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  List<Map<String, dynamic>> properties = [];

  bool isLoading = false;
  String? errorMessage;
  String? selectedType;
  String? selectedLocation;
  void loadProperties({String? type, String? location}) {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // 👇 بيانات محلية مؤقتة قبل الباك
      List<Map<String, dynamic>> allProperties = [
        {
          "image": "assets/images/apartment.jpg",
          "title": "Modern House",
          "address": "New York",
          "price": "\$1200",
          "type": "Apartment",
          "rooms": 3,
          "bath": 2,
          "sqft": 120,
        },
        {
          "image": "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",
          "title": "Luxury Villa",
          "address": "California",
          "price": "\$3500",
          "type": "Villa",
          "rooms": 5,
          "bath": 4,
          "sqft": 300,
        },
      ];

      // 👇 الفلترة حسب النوع والموقع
      properties = allProperties.where((property) {
        final matchesType = type == null || type == 'All'
            ? true
            : property["type"] == type;

        final matchesLocation = location == null || location.isEmpty
            ? true
            : property["address"].toString().toLowerCase().contains(
                location.toLowerCase(),
              );

        return matchesType && matchesLocation;
      }).toList();
    } catch (e) {
      errorMessage = "Something went wrong";
    }

    isLoading = false;
    notifyListeners();
  }

  void setType(String type) {
    selectedType = type;
    loadProperties(type: selectedType, location: selectedLocation);
  }

  void setLocation(String location) {
    selectedLocation = location;
    loadProperties(type: selectedType, location: selectedLocation);
  }
  // =========================================================
  // 🔥 2. API READY (خليه معلق للمستقبل)
  // =========================================================

  /*
  Future<void> fetchPropertiesFromApi({
    String? type,
    String? location,
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // 🔥 مثال request (عدلو حسب الباك)
      final response = await http.get(
        Uri.parse(
          "https://your-api.com/properties?"
          "type=$type&location=$location",
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        properties = List<Map<String, dynamic>>.from(data);
      } else {
        errorMessage = "Server error";
      }
    } catch (e) {
      errorMessage = "Connection error";
    }

    isLoading = false;
    notifyListeners();
  }
  */

  // =========================================================
  // 🔥 3. دوال مستقبلية (فلترة من الباك)
  // =========================================================

  /*
  void applyFilter({
    String? type,
    String? location,
  }) {
    fetchPropertiesFromApi(
      type: type,
      location: location,
    );
  }
  */
}

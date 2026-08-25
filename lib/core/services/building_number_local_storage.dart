import 'package:hive/hive.dart';

class BuildingNumberLocalStorage {
  static final box = Hive.box('buildingNumberBox');

  static const String _buildingNumberKey = 'buildingNumber';

  // ================= SAVE =================

  static Future<void> saveBuildingNumber(String buildingNumber) async {
    await box.put(_buildingNumberKey, buildingNumber);
  }

  // ================= GET =================

  static String getBuildingNumber() {
    return box.get(_buildingNumberKey, defaultValue: '123456');
  }
}

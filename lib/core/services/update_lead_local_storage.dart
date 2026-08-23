import 'package:hive/hive.dart';

class UpdateLeadLocalStorageService {
  static final box = Hive.box('authBox');

  static const String _budgetKey = 'updatedLeadBudget';
  static const String _sourceKey = 'updatedLeadSource';

  static Future<void> saveLeadPreferences({
    required double budget,
    required String source,
  }) async {
    await box.put(_budgetKey, budget);
    await box.put(_sourceKey, source);
  }

  static double? getBudget() {
    return box.get(_budgetKey);
  }

  static String? getSource() {
    return box.get(_sourceKey);
  }

  static Future<void> clearLeadPreferences() async {
    await box.delete(_budgetKey);
    await box.delete(_sourceKey);
  }
}

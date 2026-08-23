import 'package:hive/hive.dart';

class LeadLocalStorageService {
  static final box = Hive.box('authBox');

  static const String _leadIdKey = 'leadId';
  static const String _leadCreatedAtKey = 'leadCreatedAt';
  static const String _leadLastActiveAtKey = 'leadLastActiveAt';
  static const String _leadIsLeadKey = 'leadIsLead';
  static const String _leadIpKey = 'leadIp';

  static Future<void> saveLead({
    required String id,
    required String createdAt,
    required String lastActiveAt,
    required bool isLead,
    required String ip,
  }) async {
    await box.put(_leadIdKey, id);
    await box.put(_leadCreatedAtKey, createdAt);
    await box.put(_leadLastActiveAtKey, lastActiveAt);
    await box.put(_leadIsLeadKey, isLead);
    await box.put(_leadIpKey, ip);
  }

  static String? getLeadId() {
    return box.get(_leadIdKey);
  }

  static String? getCreatedAt() {
    return box.get(_leadCreatedAtKey);
  }

  static String? getLastActiveAt() {
    return box.get(_leadLastActiveAtKey);
  }

  static bool getIsLead() {
    return box.get(_leadIsLeadKey, defaultValue: false);
  }

  static String? getIp() {
    return box.get(_leadIpKey);
  }

  static Future<void> clearLead() async {
    await box.delete(_leadIdKey);
    await box.delete(_leadCreatedAtKey);
    await box.delete(_leadLastActiveAtKey);
    await box.delete(_leadIsLeadKey);
    await box.delete(_leadIpKey);
  }
}

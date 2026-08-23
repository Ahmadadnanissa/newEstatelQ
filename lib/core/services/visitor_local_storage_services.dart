import 'package:hive/hive.dart';

class VisitorLocalStorageService {
  static final box = Hive.box('authBox');

  static const String _visitorIdKey = 'visitorId';
  static const String _visitorCreatedAtKey = 'visitorCreatedAt';
  static const String _visitorLastActiveAtKey = 'visitorLastActiveAt';
  static const String _visitorIsLeadKey = 'visitorIsLead';
  static const String _visitorIpKey = 'visitorIp';

  static Future<void> saveVisitor({
    required String id,
    required String createdAt,
    required String lastActiveAt,
    required bool isLead,
    required String ip,
  }) async {
    await box.put(_visitorIdKey, id);
    await box.put(_visitorCreatedAtKey, createdAt);
    await box.put(_visitorLastActiveAtKey, lastActiveAt);
    await box.put(_visitorIsLeadKey, isLead);
    await box.put(_visitorIpKey, ip);
  }

  static String? getVisitorId() {
    return box.get(_visitorIdKey);
  }

  static String? getCreatedAt() {
    return box.get(_visitorCreatedAtKey);
  }

  static String? getLastActiveAt() {
    return box.get(_visitorLastActiveAtKey);
  }

  static bool getIsLead() {
    return box.get(_visitorIsLeadKey, defaultValue: false);
  }

  static String? getIp() {
    return box.get(_visitorIpKey);
  }

  static Future<void> clearVisitor() async {
    await box.delete(_visitorIdKey);
    await box.delete(_visitorCreatedAtKey);
    await box.delete(_visitorLastActiveAtKey);
    await box.delete(_visitorIsLeadKey);
    await box.delete(_visitorIpKey);
  }
}

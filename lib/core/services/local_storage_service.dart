import 'package:hive/hive.dart';

class LocalStorageService {
  static final box = Hive.box('authBox');
  static const String _themeKey = "isDarkMode";
  static Future<void> saveToken(String token) async {
    await box.put('token', token);
  }

  static Future<void> saveThemeMode(bool isDark) async {
    await box.put(_themeKey, isDark);
  }

  static bool getThemeMode() {
    return box.get(_themeKey, defaultValue: false);
  }

  static Future<void> saveUser({
    required String id,
    required String name,
    required String email,
  }) async {
    await box.put('id', id);
    await box.put('name', name);
    await box.put('email', email);
  }

  static Future<void> saveUserType(String type) async {
    await box.put('userType', type); // "guest" | "client"
  }

  static String? getToken() {
    return box.get('token');
  }

  static String? getEmail() {
    return box.get('email');
  }

  static String? getId() {
    return box.get('id');
  }

  static String? getUserType() {
    return box.get('userType');
  }

  static Future<void> logout() async {
    await box.clear();
  }

  static Future<void> saveResetToken(String token) async {
    await box.put('resetToken', token);
  }

  static String? getResetToken() {
    return box.get('resetToken');
  }

  static Future<void> removeResetToken() async {
    await box.delete('resetToken');
  }
}

import 'package:hive/hive.dart';

class LocalStorageService {
  static final box = Hive.box('authBox');

  static Future<void> saveToken(String token) async {
    await box.put('token', token);
  }

  static Future<void> saveUser({
    required int id,

    required String name,

    required String email,
  }) async {
    await box.put('id', id);

    await box.put('name', name);

    await box.put('email', email);
  }

  static String? getToken() {
    return box.get('token');
  }

  static String? getEmail() {
    return box.get('email');
  }

  static Future<void> logout() async {
    await box.clear();
  }
}

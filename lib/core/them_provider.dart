import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  ThemeProvider() {
    _loadTheme();
  }

  void _loadTheme() {
    _isDark = LocalStorageService.getThemeMode();
  }

  void toggleTheme() {
    _isDark = !_isDark;

    LocalStorageService.saveThemeMode(_isDark);

    notifyListeners();
  }

  void setTheme(bool value) {
    _isDark = value;

    LocalStorageService.saveThemeMode(_isDark);

    notifyListeners();
  }
}

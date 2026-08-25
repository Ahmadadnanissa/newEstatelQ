import 'package:hive/hive.dart';

class NotificationPromptLocalStorageService {
  static final box = Hive.box('authBox');

  static const String _lastShownAtKey = 'notificationPromptLastShownAt';
  static const String _acceptedKey = 'notificationPromptAccepted';

  /// Saves the time when the user pressed "Not Now".
  static Future<void> saveLastShownAt() async {
    await box.put(_lastShownAtKey, DateTime.now().toIso8601String());
  }

  /// Returns the last time the prompt was shown/dismissed by "Not Now".
  static DateTime? getLastShownAt() {
    final value = box.get(_lastShownAtKey);

    if (value == null) {
      return null;
    }

    try {
      return DateTime.parse(value.toString());
    } catch (_) {
      return null;
    }
  }

  /// Saves that the user accepted notification personalization.
  static Future<void> saveAccepted() async {
    await box.put(_acceptedKey, true);
  }

  /// Returns true if the user already accepted.
  static bool isAccepted() {
    return box.get(_acceptedKey, defaultValue: false) as bool;
  }

  /// Determines whether the prompt can be shown again.
  static bool shouldShowPrompt() {
    // If user already accepted, never show again.
    if (isAccepted()) {
      return false;
    }

    final lastShownAt = getLastShownAt();

    // First time.
    if (lastShownAt == null) {
      return true;
    }

    final difference = DateTime.now().difference(lastShownAt);

    // Show again after 48 hours.
    return difference >= const Duration(hours: 48);
  }
}

import 'package:hive/hive.dart';

class VisitorLocalStorageService {
  static final Box _box = Hive.box('visitorBox');

  // =========================
  // Keys
  // =========================

  static const String _ipKey = 'ip';
  static const String _propertyIdKey = 'propertyId';
  static const String _timeInPropertyKey = 'timeInProperty';
  static const String _createdAtKey = 'createdAt';
  static const String _sourceKey = 'source';
  static const String _minKey = 'min';
  static const String _maxKey = 'max';

  static const String _viewIdKey = 'viewId';
  static const String _likeIdKey = 'likeId';
  static const String _shareIdKey = 'shareId';

  // =========================
  // IP
  // =========================

  static Future<void> saveIp(String ip) async {
    await _box.put(_ipKey, ip);
  }

  static String? getIp() {
    return _box.get(_ipKey);
  }

  // =========================
  // Property ID
  // =========================

  static Future<void> savePropertyId(String propertyId) async {
    await _box.put(_propertyIdKey, propertyId);
  }

  static String? getPropertyId() {
    return _box.get(_propertyIdKey);
  }

  // =========================
  // Time In Property
  // =========================

  static Future<void> saveTimeInProperty(int timeInProperty) async {
    await _box.put(_timeInPropertyKey, timeInProperty);
  }

  static int? getTimeInProperty() {
    return _box.get(_timeInPropertyKey);
  }

  // =========================
  // Created At
  // =========================

  static Future<void> saveCreatedAt(String createdAt) async {
    await _box.put(_createdAtKey, createdAt);
  }

  static String? getCreatedAt() {
    return _box.get(_createdAtKey);
  }

  // =========================
  // Source
  // =========================

  static Future<void> saveSource(String source) async {
    await _box.put(_sourceKey, source);
  }

  static String? getSource() {
    return _box.get(_sourceKey);
  }

  // =========================
  // Min
  // =========================

  static Future<void> saveMin(double min) async {
    await _box.put(_minKey, min);
  }

  static double? getMin() {
    final value = _box.get(_minKey);

    if (value == null) {
      return null;
    }

    return (value as num).toDouble();
  }

  // =========================
  // Max
  // =========================

  static Future<void> saveMax(double max) async {
    await _box.put(_maxKey, max);
  }

  static double? getMax() {
    final value = _box.get(_maxKey);

    if (value == null) {
      return null;
    }

    return (value as num).toDouble();
  }

  // =========================
  // View ID
  // =========================

  static Future<void> saveViewId(String propertyId) async {
    await _box.put(_viewIdKey, propertyId);
  }

  static String? getViewId() {
    return _box.get(_viewIdKey);
  }

  // =========================
  // Like ID
  // =========================

  static Future<void> saveLikeId(String propertyId) async {
    await _box.put(_likeIdKey, propertyId);
  }

  static String? getLikeId() {
    return _box.get(_likeIdKey);
  }

  // =========================
  // Share ID
  // =========================

  static Future<void> saveShareId(String propertyId) async {
    await _box.put(_shareIdKey, propertyId);
  }

  static String? getShareId() {
    return _box.get(_shareIdKey);
  }

  // =========================
  // Delete individual values
  // =========================

  static Future<void> removeViewId() async {
    await _box.delete(_viewIdKey);
  }

  static Future<void> removeLikeId() async {
    await _box.delete(_likeIdKey);
  }

  static Future<void> removeShareId() async {
    await _box.delete(_shareIdKey);
  }

  static Future<void> removePropertyData() async {
    await _box.delete(_propertyIdKey);
    await _box.delete(_timeInPropertyKey);
    await _box.delete(_viewIdKey);
    await _box.delete(_likeIdKey);
    await _box.delete(_shareIdKey);
  }

  // =========================
  // Clear everything
  // =========================

  static Future<void> clear() async {
    await _box.clear();
  }
}

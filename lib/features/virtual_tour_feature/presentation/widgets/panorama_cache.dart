import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class PanoramaCache {
  PanoramaCache()
    : _manager = CacheManager(
        Config(
          'virtual-tour-panoramas',
          stalePeriod: const Duration(days: 14),
          maxNrOfCacheObjects: 8,
        ),
      );
  final CacheManager _manager;
  Future<File> get(String url) => _manager.getSingleFile(url);
  Future<void> prefetch(String url) async {
    await _manager.getSingleFile(url);
  }

  Future<void> evict(String url) => _manager.removeFile(url);
  Future<void> clear() => _manager.emptyCache();
}

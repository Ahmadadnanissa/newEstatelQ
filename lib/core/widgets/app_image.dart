import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  final BoxFit fit;
  final bool isNetwork;

  /// 👇 جودة الصورة
  final FilterQuality filterQuality;

  /// 👇 هل نستخدم تحسين الأداء (cacheWidth)
  final bool enableResizeCache;

  const AppImage({
    super.key,
    required this.path,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.isNetwork = false,
    this.filterQuality = FilterQuality.high,
    this.enableResizeCache = true,
  });

  int? _calculateCacheWidth(BuildContext context) {
    if (!enableResizeCache) return null;

    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    if (!width.isFinite) return null;

    final cacheWidth = (width * devicePixelRatio).toInt();

    if (cacheWidth < 300) return null;

    return cacheWidth;
  }

  @override
  Widget build(BuildContext context) {
    final cacheWidthValue = _calculateCacheWidth(context);

    final image = isNetwork
        ? Image.network(
            path,
            width: width,
            height: height,
            fit: fit,
            filterQuality: filterQuality,
            cacheWidth: cacheWidthValue,
          )
        : Image.asset(
            path,
            width: width,
            height: height,
            fit: fit,
            filterQuality: filterQuality,
            cacheWidth: cacheWidthValue,
          );

    return image;
  }
}

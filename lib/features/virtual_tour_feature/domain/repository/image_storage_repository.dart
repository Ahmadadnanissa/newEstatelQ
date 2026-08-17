import 'dart:typed_data';
import '../entities/stored_image.dart';

abstract interface class ImageStorageRepository {
  Future<StoredImage> uploadPanorama({required Uint8List bytes, required String fileName, void Function(double progress)? onProgress});
  /// Client-side unsigned Cloudinary uploads cannot safely destroy assets; lifecycle deletion belongs to retention tooling.
  Future<void> deleteAsset(String assetId);
}

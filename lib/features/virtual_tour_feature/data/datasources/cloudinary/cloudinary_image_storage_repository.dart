import 'dart:typed_data';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/image_storage_repository.dart';

import '../../../domain/entities/stored_image.dart';

class CloudinaryUnsignedConfig {
  const CloudinaryUnsignedConfig({
    required this.cloudName,
    required this.uploadPreset,
    this.folder,
  });
  final String cloudName;
  final String uploadPreset;
  final String? folder;
}

class CloudinaryImageStorageRepository implements ImageStorageRepository {
  CloudinaryImageStorageRepository(this._config)
    : _client = CloudinaryPublic(
        _config.cloudName,
        _config.uploadPreset,
        cache: false,
      );
  final CloudinaryUnsignedConfig _config;
  final CloudinaryPublic _client;

  @override
  Future<StoredImage> uploadPanorama({
    required Uint8List bytes,
    required String fileName,
    void Function(double progress)? onProgress,
  }) async {
    final response = await _client.uploadFile(
      CloudinaryFile.fromBytesData(
        bytes,
        identifier: fileName,
        folder: _config.folder,
        resourceType: CloudinaryResourceType.Image,
      ),
      onProgress: (sent, total) {
        if (total > 0) onProgress?.call(sent / total);
      },
    );
    return StoredImage(
      secureUrl: response.secureUrl,
      assetId: response.publicId,
      width: (response.data['width'] as num?)?.toInt(),
      height: (response.data['height'] as num?)?.toInt(),
      bytes: bytes.length,
    );
  }

  @override
  Future<void> deleteAsset(String assetId) async {
    // Destroy requires a signed server request. Do not place a Cloudinary API secret in a client application.
  }
}

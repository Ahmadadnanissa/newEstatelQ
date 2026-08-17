class StoredImage {
  const StoredImage({required this.secureUrl, required this.assetId, this.width, this.height, this.bytes});
  final String secureUrl, assetId;
  final int? width, height, bytes;
}

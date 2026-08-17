import 'dart:typed_data';
import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/image_storage_repository.dart';
import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';
import 'package:estatelqapp/features/virtual_tour_feature/presentation/widgets/unsaved_changes_guard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';
import '../../domain/entities/room.dart';
import '../../domain/entities/virtual_tour.dart';
import '../providers/virtual_tour_controller.dart';

class RoomEditScreen extends StatefulWidget {
  const RoomEditScreen({
    super.key,
    required this.tour,
    required this.repository,
    required this.imageStorage,
    required this.scopeId,
    required this.actorId,
    this.room,
  });

  final VirtualTour tour;
  final VirtualTourRepository repository;
  final ImageStorageRepository imageStorage;
  final String scopeId;
  final String actorId;
  final TourRoom? room;

  @override
  State<RoomEditScreen> createState() => _RoomEditScreenState();
}

class _RoomEditScreenState extends State<RoomEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  String? _panoramaUrl;
  String? _storageAssetId;
  int? _panoramaWidth;
  int? _panoramaHeight;
  bool _hasChanges = false;
  bool _isUploading = false;
  double _uploadProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.room?.name ?? '');
    _panoramaUrl = widget.room?.panoramaUrl;
    _storageAssetId = widget.room?.storageAssetId;
    _panoramaWidth = widget.room?.panoramaWidth;
    _panoramaHeight = widget.room?.panoramaHeight;

    _nameController.addListener(_onChanged);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (!_hasChanges) {
      setState(() => _hasChanges = true);
    }
  }

  Future<void> _pickPanorama() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    setState(() => _isUploading = true);

    try {
      final bytes = await image.readAsBytes();

      // Validate file size (max 25MB)
      if (bytes.length > 25 * 1024 * 1024) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Image too large. Maximum 25MB allowed.'),
            ),
          );
        }
        setState(() => _isUploading = false);
        return;
      }

      final uploaded = await widget.imageStorage.uploadPanorama(
        bytes: bytes,
        fileName: image.name,
        onProgress: (progress) {
          setState(() => _uploadProgress = progress);
        },
      );

      setState(() {
        _panoramaUrl = uploaded.secureUrl;
        _storageAssetId = uploaded.assetId;
        _panoramaWidth = uploaded.width;
        _panoramaHeight = uploaded.height;
        _hasChanges = true;
        _isUploading = false;
        _uploadProgress = 0.0;
      });
    } catch (e) {
      setState(() => _isUploading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload panorama: $e')),
        );
      }
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    if (_panoramaUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please upload a panorama image')),
      );
      return;
    }

    final controller = context.read<VirtualTourController>();

    try {
      if (widget.room == null) {
        // Calculate sort order for new room
        final rooms = await widget.repository.watchRooms(widget.tour.id).first;
        final sortOrder = rooms.length;

        await controller.addRoom(
          tour: widget.tour,
          name: _nameController.text,
          imageBytes: Uint8List(0), // Already uploaded
          fileName: 'panorama.jpg',
          sortOrder: sortOrder,
          existingUrl: _panoramaUrl,
          existingAssetId: _storageAssetId,
          existingWidth: _panoramaWidth,
          existingHeight: _panoramaHeight,
        );
      } else {
        await controller.saveRoom(
          widget.room!.copyWith(
            name: _nameController.text,
            panoramaUrl: _panoramaUrl,
            storageAssetId: _storageAssetId,
            panoramaWidth: _panoramaWidth,
            panoramaHeight: _panoramaHeight,
          ),
        );
      }

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.room == null
                  ? 'Room added successfully'
                  : 'Room updated successfully',
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to save room: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return UnsavedChangesGuard(
      hasUnsavedChanges: _hasChanges,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.room == null ? 'Add Room' : 'Edit Room'),
          actions: [
            if (_hasChanges)
              TextButton(onPressed: _save, child: const Text('Save')),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Room Name',
                  hintText: 'e.g., Living Room, Kitchen',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a room name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Text(
                '360° Panorama',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Upload an equirectangular 2:1 panorama image (JPEG/WebP recommended)',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: _isUploading ? null : _pickPanorama,
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: _isUploading
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(value: _uploadProgress),
                            const SizedBox(height: 16),
                            Text('${(_uploadProgress * 100).toInt()}%'),
                          ],
                        )
                      : _panoramaUrl != null
                      ? Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  _panoramaUrl!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Center(
                                        child: Icon(Icons.broken_image),
                                      ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '${_panoramaWidth ?? 0}x${_panoramaHeight ?? 0}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.panorama, size: 48),
                              SizedBox(height: 8),
                              Text('Tap to upload panorama'),
                              SizedBox(height: 4),
                              Text(
                                'Max 25MB',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),
              if (_panoramaWidth != null && _panoramaHeight != null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Image Details',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text('Resolution: $_panoramaWidth x $_panoramaHeight'),
                        Text(
                          'Aspect Ratio: ${(_panoramaWidth! / _panoramaHeight!).toStringAsFixed(2)}',
                        ),
                        if (_panoramaWidth! / _panoramaHeight! >= 1.9 &&
                            _panoramaWidth! / _panoramaHeight! <= 2.1)
                          const Text(
                            '✓ Correct 2:1 equirectangular ratio',
                            style: TextStyle(color: Colors.green),
                          )
                        else
                          const Text(
                            '⚠ Not a standard 2:1 equirectangular ratio',
                            style: TextStyle(color: Colors.orange),
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/image_storage_repository.dart';
import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';
import 'package:estatelqapp/features/virtual_tour_feature/presentation/widgets/unsaved_changes_guard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/virtual_tour.dart';
import '../providers/virtual_tour_controller.dart';

class TourEditScreen extends StatefulWidget {
  const TourEditScreen({
    super.key,
    required this.repository,
    required this.imageStorage,
    this.tour,
    required this.scopeId,
    required this.actorId,
  });

  final VirtualTourRepository repository;
  final ImageStorageRepository imageStorage;
  final VirtualTour? tour;
  final String scopeId;
  final String actorId;

  @override
  State<TourEditScreen> createState() => _TourEditScreenState();
}

class _TourEditScreenState extends State<TourEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  VirtualTourStatus _status = VirtualTourStatus.draft;
  String? _coverImageUrl;
  bool _hasChanges = false;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.tour?.title ?? '');
    _descriptionController = TextEditingController(
      text: widget.tour?.description ?? '',
    );
    _status = widget.tour?.status ?? VirtualTourStatus.draft;
    _coverImageUrl = widget.tour?.coverImageUrl;

    _titleController.addListener(_onChanged);
    _descriptionController.addListener(_onChanged);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (!_hasChanges) {
      setState(() => _hasChanges = true);
    }
  }

  Future<void> _pickCoverImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1920,
      maxHeight: 1080,
      imageQuality: 85,
    );

    if (image == null) return;

    setState(() => _isUploading = true);

    try {
      final bytes = await image.readAsBytes();
      final uploaded = await widget.imageStorage.uploadPanorama(
        bytes: bytes,
        fileName: 'cover_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );

      setState(() {
        _coverImageUrl = uploaded.secureUrl;
        _hasChanges = true;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to upload image: $e')));
      }
    } finally {
      setState(() => _isUploading = false);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final controller = context.read<VirtualTourController>();

    try {
      if (widget.tour == null) {
        await controller.createTour(
          title: _titleController.text,
          description: _descriptionController.text,
        );
      } else {
        await controller.saveTour(
          widget.tour!.copyWith(
            title: _titleController.text,
            description: _descriptionController.text,
            coverImageUrl: _coverImageUrl,
            status: _status,
          ),
        );
      }

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.tour == null
                  ? 'Tour created successfully'
                  : 'Tour updated successfully',
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to save tour: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return UnsavedChangesGuard(
      hasUnsavedChanges: _hasChanges,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.tour == null ? 'Create Tour' : 'Edit Tour'),
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
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter tour title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter tour description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<VirtualTourStatus>(
                initialValue: _status,
                decoration: const InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(),
                ),
                items: VirtualTourStatus.values.map((status) {
                  return DropdownMenuItem(
                    value: status,
                    child: Text(status.name.capitalize()),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _status = value;
                      _hasChanges = true;
                    });
                  }
                },
              ),
              const SizedBox(height: 24),
              Text(
                'Cover Image',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _isUploading ? null : _pickCoverImage,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: _isUploading
                      ? const Center(child: CircularProgressIndicator())
                      : _coverImageUrl != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            _coverImageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Center(child: Icon(Icons.broken_image)),
                          ),
                        )
                      : const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_photo_alternate, size: 48),
                              SizedBox(height: 8),
                              Text('Tap to add cover image'),
                            ],
                          ),
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

extension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

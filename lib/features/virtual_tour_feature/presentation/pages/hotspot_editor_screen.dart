import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';
import 'package:estatelqapp/features/virtual_tour_feature/presentation/widgets/panorama_surface.dart';
import 'package:estatelqapp/features/virtual_tour_feature/presentation/widgets/unsaved_changes_guard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/hotspot.dart';
import '../../domain/entities/room.dart';
import '../providers/virtual_tour_controller.dart';

class HotspotEditorScreen extends StatefulWidget {
  const HotspotEditorScreen({
    super.key,
    required this.room,
    required this.repository,
    required this.scopeId,
    required this.actorId,
  });

  final TourRoom room;
  final VirtualTourRepository repository;
  final String scopeId;
  final String actorId;

  @override
  State<HotspotEditorScreen> createState() => _HotspotEditorScreenState();
}

class _HotspotEditorScreenState extends State<HotspotEditorScreen> {
  TourHotspot? _selectedHotspot;
  bool _isEditing = false;
  bool _hasChanges = false;

  @override
  Widget build(BuildContext context) {
    return UnsavedChangesGuard(
      hasUnsavedChanges: _hasChanges,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hotspots: ${widget.room.name}'),
          actions: [
            IconButton(
              icon: const Icon(Icons.help_outline),
              onPressed: () => _showHelp(context),
              tooltip: 'Help',
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<TourHotspot>>(
                stream: widget.repository.watchHotspots(widget.room.id),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final hotspots = snapshot.data!;
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: PanoramaSurface(
                          imageUrl: widget.room.panoramaUrl,
                          hotspots: hotspots,
                          onPanoramaTap: _isEditing
                              ? null
                              : (yaw, pitch) => _onPanoramaTap(yaw, pitch),
                          onHotspotTap: (hotspot) => _selectHotspot(hotspot),
                          interactive: true,
                        ),
                      ),
                      if (_isEditing && _selectedHotspot == null)
                        Positioned(
                          bottom: 16,
                          left: 16,
                          right: 16,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Tap on the panorama to place a hotspot',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () =>
                                            setState(() => _isEditing = false),
                                        child: const Text('Cancel'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            _buildBottomPanel(context),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _isEditing
              ? null
              : () => setState(() {
                  _isEditing = true;
                  _selectedHotspot = null;
                }),
          icon: const Icon(Icons.add_location),
          label: const Text('Add Hotspot'),
        ),
      ),
    );
  }

  Widget _buildBottomPanel(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_selectedHotspot != null)
            _HotspotEditPanel(
              hotspot: _selectedHotspot!,
              room: widget.room,
              repository: widget.repository,
              onSave: () {
                setState(() {
                  _selectedHotspot = null;
                  _hasChanges = true;
                });
              },
              onDelete: () {
                setState(() {
                  _selectedHotspot = null;
                  _hasChanges = true;
                });
              },
              onCancel: () => setState(() => _selectedHotspot = null),
            )
          else
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Tap a hotspot to edit, or use the button to add a new one',
                style: TextStyle(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }

  void _onPanoramaTap(double yaw, double pitch) {
    setState(() {
      _selectedHotspot = TourHotspot(
        id: '',
        tourId: widget.room.tourId,
        scopeId: widget.scopeId,
        sourceRoomId: widget.room.id,
        yaw: yaw,
        pitch: pitch,
        type: HotspotType.navigation,
        isEnabled: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      _isEditing = false;
    });
  }

  void _selectHotspot(TourHotspot hotspot) {
    setState(() => _selectedHotspot = hotspot);
  }

  void _showHelp(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialog) => AlertDialog(
        title: const Text('Hotspot Editor Help'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Creating Hotspots:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('1. Tap "Add Hotspot" button'),
              Text('2. Tap anywhere on the panorama'),
              Text('3. Configure the hotspot details'),
              SizedBox(height: 16),
              Text(
                'Hotspot Types:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('• Navigation: Links to another room'),
              Text('• Information: Shows text/details'),
              SizedBox(height: 16),
              Text('Tips:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('• Place hotspots at eye level (pitch ≈ 0)'),
              Text('• Test navigation before publishing'),
              Text('• Use descriptive labels for better UX'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}

class _HotspotEditPanel extends StatefulWidget {
  const _HotspotEditPanel({
    required this.hotspot,
    required this.room,
    required this.repository,
    required this.onSave,
    required this.onDelete,
    required this.onCancel,
  });

  final TourHotspot hotspot;
  final TourRoom room;
  final VirtualTourRepository repository;
  final VoidCallback onSave;
  final VoidCallback onDelete;
  final VoidCallback onCancel;

  @override
  State<_HotspotEditPanel> createState() => _HotspotEditPanelState();
}

class _HotspotEditPanelState extends State<_HotspotEditPanel> {
  late final TextEditingController _labelController;
  late HotspotType _type;
  String? _targetRoomId;
  bool _isEnabled = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _labelController = TextEditingController(text: widget.hotspot.label ?? '');
    _type = widget.hotspot.type;
    _targetRoomId = widget.hotspot.targetRoomId;
    _isEnabled = widget.hotspot.isEnabled;
  }

  @override
  void dispose() {
    _labelController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final controller = context.read<VirtualTourController>();

    try {
      if (widget.hotspot.id.isEmpty) {
        // New hotspot
        await controller.saveHotspot(
          source: widget.room,
          yaw: widget.hotspot.yaw,
          pitch: widget.hotspot.pitch,
          targetRoomId: _type == HotspotType.navigation ? _targetRoomId : null,
          label: _labelController.text.trim().isEmpty
              ? null
              : _labelController.text.trim(),
        );
      } else {
        // Update existing hotspot
        await controller.saveHotspot(
          existing: widget.hotspot.copyWith(
            type: _type,
            targetRoomId: _type == HotspotType.navigation
                ? _targetRoomId
                : null,
            label: _labelController.text.trim().isEmpty
                ? null
                : _labelController.text.trim(),
            isEnabled: _isEnabled,
          ),
          source: widget.room,
          yaw: widget.hotspot.yaw,
          pitch: widget.hotspot.pitch,
        );
      }

      widget.onSave();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to save hotspot: $e')));
      }
    }
  }

  Future<void> _delete() async {
    if (widget.hotspot.id.isEmpty) {
      widget.onCancel();
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: const Text('Delete Hotspot'),
        content: const Text('Are you sure you want to delete this hotspot?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialog, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      if (!mounted) return;
      final controller = context.read<VirtualTourController>();
      await controller.deleteHotspot(widget.hotspot);
      widget.onDelete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Edit Hotspot',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Switch(
                  value: _isEnabled,
                  onChanged: (value) => setState(() => _isEnabled = value),
                ),
                const Text('Enabled'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _InfoCard(
                    label: 'Yaw',
                    value: '${widget.hotspot.yaw.toStringAsFixed(1)}°',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _InfoCard(
                    label: 'Pitch',
                    value: '${widget.hotspot.pitch.toStringAsFixed(1)}°',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<HotspotType>(
              initialValue: _type,
              decoration: const InputDecoration(
                labelText: 'Type',
                border: OutlineInputBorder(),
              ),
              items: HotspotType.values.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type.name.capitalize()),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _type = value);
                }
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _labelController,
              decoration: const InputDecoration(
                labelText: 'Label',
                hintText: 'e.g., Go to Kitchen',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            if (_type == HotspotType.navigation)
              StreamBuilder<List<TourRoom>>(
                stream: widget.repository.watchRooms(widget.room.tourId),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final rooms = snapshot.data!
                      .where((r) => r.id != widget.room.id)
                      .toList();

                  if (rooms.isEmpty) {
                    return const Text(
                      'No other rooms available to link to',
                      style: TextStyle(color: Colors.orange),
                    );
                  }

                  return DropdownButtonFormField<String>(
                    initialValue: _targetRoomId,
                    decoration: const InputDecoration(
                      labelText: 'Target Room',
                      border: OutlineInputBorder(),
                    ),
                    hint: const Text('Select target room'),
                    items: rooms.map((room) {
                      return DropdownMenuItem(
                        value: room.id,
                        child: Text(room.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => _targetRoomId = value);
                    },
                  );
                },
              ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: widget.onCancel,
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton(
                    onPressed: _save,
                    child: const Text('Save'),
                  ),
                ),
                const SizedBox(width: 8),
                if (widget.hotspot.id.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: _delete,
                    tooltip: 'Delete hotspot',
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

extension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

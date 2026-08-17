import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:estatelqapp/features/virtual_tour_feature/domain/repository/virtual_tour_repository.dart';
import 'package:estatelqapp/features/virtual_tour_feature/presentation/widgets/panorama_cache.dart';
import 'package:estatelqapp/features/virtual_tour_feature/presentation/widgets/panorama_surface.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/hotspot.dart';
import '../../domain/entities/room.dart';
import '../../data/cache/offline_cache.dart';

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

class VirtualTourViewerScreen extends StatefulWidget {
  const VirtualTourViewerScreen({
    super.key,
    required this.repository,
    required this.tourId,
    this.initialRoomId,
  });
  final VirtualTourRepository repository;
  final String tourId;
  final String? initialRoomId;
  @override
  State<VirtualTourViewerScreen> createState() =>
      _VirtualTourViewerScreenState();
}

class _VirtualTourViewerScreenState extends State<VirtualTourViewerScreen> {
  final PanoramaCache _cache = PanoramaCache();
  final OfflineCache _offlineCache = OfflineCache.instance;
  String? _roomId;
  String? _prefetchedRoom;
  bool _isOnline = true;
  List<TourRoom>? _cachedRooms;
  final Map<String, List<TourHotspot>> _cachedHotspots = {};

  @override
  void initState() {
    super.initState();
    _roomId = widget.initialRoomId;
    _checkConnectivity();
    _loadCachedData();
  }

  Future<void> _checkConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    setState(() {
      _isOnline = !result.contains(ConnectivityResult.none);
    });

    Connectivity().onConnectivityChanged.listen((results) {
      setState(() {
        _isOnline = !results.contains(ConnectivityResult.none);
      });
      if (_isOnline) {
        _refreshFromNetwork();
      }
    });
  }

  Future<void> _loadCachedData() async {
    final rooms = await _offlineCache.getCachedRooms(widget.tourId);
    if (rooms != null) {
      setState(() => _cachedRooms = rooms);
      for (final room in rooms) {
        final hotspots = await _offlineCache.getCachedHotspots(room.id);
        if (hotspots != null) {
          _cachedHotspots[room.id] = hotspots;
        }
      }
    }
  }

  Future<void> _refreshFromNetwork() async {
    setState(() => _cachedRooms = null);
    _cachedHotspots.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<TourRoom>>(
        stream: widget.repository.watchRooms(widget.tourId),
        builder: (context, roomsSnapshot) {
          // Use cached data if offline and network fails
          final rooms = roomsSnapshot.hasData
              ? roomsSnapshot.data!
              : _cachedRooms;

          if (roomsSnapshot.hasError && _cachedRooms == null) {
            return _StateScaffold(
              message: 'The tour could not be loaded.',
              retry: () => setState(() {}),
              isOffline: !_isOnline,
            );
          }

          if (rooms == null) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (rooms.isEmpty) {
            return const _StateScaffold(
              message: 'This tour has no published rooms.',
            );
          }

          // Cache rooms for offline use
          if (roomsSnapshot.hasData && _isOnline) {
            _offlineCache.cacheRooms(widget.tourId, rooms);
          }

          final room = rooms.firstWhere(
            (r) => r.id == _roomId,
            orElse: () => rooms.first,
          );

          return Stack(
            children: [
              Positioned.fill(
                child: StreamBuilder<List<TourHotspot>>(
                  stream: widget.repository.watchHotspots(room.id),
                  builder: (context, hotspotsSnapshot) {
                    final hotspots = hotspotsSnapshot.hasData
                        ? hotspotsSnapshot.data!
                        : _cachedHotspots[room.id] ?? const <TourHotspot>[];

                    // Cache hotspots for offline use
                    if (hotspotsSnapshot.hasData && _isOnline) {
                      _offlineCache.cacheHotspots(room.id, hotspots);
                      _cachedHotspots[room.id] = hotspots;
                    }

                    _prefetchNext(rooms, hotspots);

                    return Stack(
                      children: [
                        Positioned.fill(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 220),
                            child: PanoramaSurface(
                              key: ValueKey(room.id),
                              imageUrl: room.panoramaUrl,
                              hotspots: hotspots,
                              onHotspotTap: (hotspot) {
                                if (hotspot.targetRoomId != null) {
                                  setState(
                                    () => _roomId = hotspot.targetRoomId,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.paddingOf(context).top + 12,
                          left: 12,
                          child: _RoomMenu(
                            rooms: rooms,
                            selectedId: room.id,
                            onSelect: (id) => setState(() => _roomId = id),
                          ),
                        ),
                        if (!_isOnline)
                          Positioned(
                            top: MediaQuery.paddingOf(context).top + 12,
                            right: 12,
                            child: _OfflineIndicator(),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _prefetchNext(List<TourRoom> rooms, List<TourHotspot> hotspots) {
    final destination = hotspots
        .map((h) => h.targetRoomId)
        .whereType<String>()
        .firstOrNull;
    if (destination == null || destination == _prefetchedRoom) return;
    final next = rooms.where((r) => r.id == destination).firstOrNull;
    if (next != null) {
      _prefetchedRoom = next.id;
      _cache.prefetch(next.panoramaUrl).catchError((_) {});
    }
  }
}

class _RoomMenu extends StatelessWidget {
  const _RoomMenu({
    required this.rooms,
    required this.selectedId,
    required this.onSelect,
  });
  final List<TourRoom> rooms;
  final String selectedId;
  final ValueChanged<String> onSelect;
  @override
  Widget build(BuildContext context) => PopupMenuButton<String>(
    tooltip: 'Rooms',
    icon: const Icon(Icons.list, color: Colors.white),
    onSelected: onSelect,
    itemBuilder: (_) => rooms
        .map((r) => PopupMenuItem(value: r.id, child: Text(r.name)))
        .toList(),
  );
}

class _StateScaffold extends StatelessWidget {
  const _StateScaffold({
    required this.message,
    this.retry,
    this.isOffline = false,
  });
  final String message;
  final VoidCallback? retry;
  final bool isOffline;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isOffline ? Icons.cloud_off : Icons.error_outline,
            size: 48,
            color: isOffline ? Colors.orange : Colors.red,
          ),
          const SizedBox(height: 12),
          Text(message),
          if (isOffline)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Using cached data when available',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ),
          if (retry != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextButton(onPressed: retry, child: const Text('Retry')),
            ),
        ],
      ),
    ),
  );
}

class _OfflineIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 4),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.cloud_off, size: 16, color: Colors.white),
          SizedBox(width: 4),
          Text(
            'Offline',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/custom_app_bar_for_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class PropertyOnMap extends StatefulWidget {
  const PropertyOnMap({
    super.key,
    required this.propertyLat,
    required this.propertyLng,
  });

  final double propertyLat;
  final double propertyLng;

  static String id = 'PropertyOnMap';

  @override
  State<PropertyOnMap> createState() => _PropertyOnMapState();
}

class _PropertyOnMapState extends State<PropertyOnMap> {
  final MapController _mapController = MapController();

  LatLng? _currentLocation;
  late LatLng _propertyLocation;

  List<LatLng> _routePoints = [];

  bool _isMapReady = false;

  final String apiKey =
      "eyJvcmciOiI1YjNjZTM1OTc4NTExMTAwMDFjZjYyNDgiLCJpZCI6IjRhOGI1ODYyOGUzODQwOGY4NGI5NTAwZmI1ZmU4ZDRhIiwiaCI6Im11cm11cjY0In0=";

  @override
  void initState() {
    super.initState();
    _propertyLocation = LatLng(widget.propertyLat, widget.propertyLng);
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) return;

    Position pos = await Geolocator.getCurrentPosition();

    final userLocation = LatLng(pos.latitude, pos.longitude);

    setState(() {
      _currentLocation = userLocation;
    });

    /// 🔥 هون أهم خطوة: جلب المسار الحقيقي
    await _getRoute();

    Future.delayed(const Duration(milliseconds: 300), () {
      if (_isMapReady && _currentLocation != null) {
        final bounds = LatLngBounds.fromPoints([
          _currentLocation!,
          _propertyLocation,
        ]);

        _mapController.fitCamera(
          CameraFit.bounds(bounds: bounds, padding: const EdgeInsets.all(80)),
        );
      }
    });
  }

  Future<void> _getRoute() async {
    if (_currentLocation == null) return;

    final url = Uri.parse(
      'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=${_currentLocation!.longitude},${_currentLocation!.latitude}&end=${_propertyLocation.longitude},${_propertyLocation.latitude}',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List coords = data['features'][0]['geometry']['coordinates'];

      List<LatLng> points = coords.map((coord) {
        return LatLng(coord[1], coord[0]);
      }).toList();

      setState(() {
        _routePoints = points;
      });
    } else {
      // ignore: avoid_print
      print("Error fetching route");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarForProfile(title: 'Property Location'),
        body: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _propertyLocation,
                initialZoom: 13,
                onMapReady: () {
                  _isMapReady = true;
                },
              ),
              children: [
                /// 🗺️ الخريطة
                TileLayer(
                  tileProvider: CancellableNetworkTileProvider(),
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                  userAgentPackageName: 'com.example.estatelqapp',
                ),

                /// 📍 الماركرز
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _propertyLocation,
                      width: 45,
                      height: 45,
                      child: Icon(Icons.home, color: secondaryColor, size: 35),
                    ),
                    if (_currentLocation != null)
                      Marker(
                        point: _currentLocation!,
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.my_location,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                  ],
                ),

                /// 🔥 المسار الحقيقي (مو خط مستقيم)
                if (_routePoints.isNotEmpty)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: _routePoints,
                        strokeWidth: 5,
                        color: secondaryColor,
                      ),
                    ],
                  ),
              ],
            ),

            /// 📌 زر الرجوع للمستخدم
            Positioned(
              top: width * 0.11,
              right: width * 0.044,
              child: FloatingActionButton(
                mini: true,
                backgroundColor: Colors.white,
                onPressed: () {
                  if (_currentLocation != null) {
                    _mapController.move(_currentLocation!, 15);
                  }
                },
                child: const Icon(Icons.my_location, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

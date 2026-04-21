import 'dart:convert';

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/custom_app_bar_for_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapPageForRequestPage extends StatefulWidget {
  const MapPageForRequestPage({super.key});
  static String id = 'MapPageForRequestPage';

  @override
  State<MapPageForRequestPage> createState() => _MapPageForRequestPageState();
}

class _MapPageForRequestPageState extends State<MapPageForRequestPage> {
  final MapController _mapController = MapController();

  LatLng? _currentLocation;
  LatLng? _selectedPoint;

  bool _isMapReady = false;
  bool isLoadingAddress = false;

  String selectedAddress = '';

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  // ✅ جلب موقع المستخدم
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

    Future.delayed(const Duration(milliseconds: 300), () {
      if (_isMapReady) {
        _mapController.move(userLocation, 15.5);
      }
    });
  }

  // ✅ جلب العنوان من API
  Future<void> getAddressFromAPI(LatLng point) async {
    setState(() {
      isLoadingAddress = true;
    });

    final url =
        "https://nominatim.openstreetmap.org/reverse?lat=${point.latitude}&lon=${point.longitude}&format=json";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'User-Agent': 'estatelqapp', // مهم جداً
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final address = data["address"];

        setState(() {
          selectedAddress =
              "${address["country"] ?? ''} / ${address["state"] ?? ''} / ${address["city"] ?? address["town"] ?? address["village"] ?? ''}";
        });
      } else {
        setState(() {
          selectedAddress = "Unknown location";
        });
      }
    } catch (e) {
      setState(() {
        selectedAddress = "Unknown location";
      });
    }

    setState(() {
      isLoadingAddress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarForProfile(title: 'Select Property Location'),
        body: Stack(
          children: [
            /// 🗺️ الخريطة
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter:
                    _currentLocation ?? const LatLng(34.730610, 36.708964),
                initialZoom: 15.5,
                onMapReady: () {
                  _isMapReady = true;
                },

                /// 👇 لما المستخدم يكبس على الخريطة
                onTap: (tapPosition, point) async {
                  setState(() {
                    _selectedPoint = point;
                  });

                  await getAddressFromAPI(point);
                },
              ),
              children: [
                /// Tiles
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
                    if (_currentLocation != null)
                      Marker(
                        point: _currentLocation!,
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.my_location,
                          color: Colors.blue,
                        ),
                      ),

                    if (_selectedPoint != null)
                      Marker(
                        point: _selectedPoint!,
                        width: 45,
                        height: 45,
                        child: Icon(Icons.location_on, color: secondaryColor),
                      ),
                  ],
                ),
              ],
            ),

            /// 📍 عرض العنوان
            if (_selectedPoint != null)
              Positioned(
                top: width * 0.2,
                left: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: isLoadingAddress
                      ? const Center(child: CircularProgressIndicator())
                      : Text(
                          selectedAddress.isEmpty
                              ? "Getting address..."
                              : selectedAddress,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14),
                        ),
                ),
              ),

            /// 🎯 زر تحديد موقعي
            Positioned(
              top: width * 0.1,
              right: width * 0.04,
              child: FloatingActionButton(
                mini: true,
                backgroundColor: Colors.white,
                onPressed: () {
                  if (_currentLocation != null) {
                    _mapController.move(_currentLocation!, 15.5);
                  }
                },
                child: const Icon(Icons.my_location, color: Colors.blue),
              ),
            ),

            /// ✅ زر التأكيد
            Positioned(
              bottom: width * 0.1,
              left: width * 0.25,
              right: width * 0.25,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (_selectedPoint != null && selectedAddress.isNotEmpty) {
                    Navigator.pop(context, {
                      "lat": _selectedPoint!.latitude,
                      "lng": _selectedPoint!.longitude,
                      "address": selectedAddress,
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select location and wait..."),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Confirm Location",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

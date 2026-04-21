import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/custom_app_bar_for_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class EnterYourAdressWithMapPage extends StatefulWidget {
  const EnterYourAdressWithMapPage({super.key});
  static String id = 'EnterYourAdressWithMapPage';

  @override
  State<EnterYourAdressWithMapPage> createState() =>
      _EnterYourAdressWithMapPageState();
}

class _EnterYourAdressWithMapPageState
    extends State<EnterYourAdressWithMapPage> {
  final MapController _mapController = MapController();

  LatLng? _currentLocation;
  LatLng? _selectedPoint;
  bool _isMapReady = false;

  @override
  void initState() {
    super.initState();
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

    Future.delayed(const Duration(milliseconds: 300), () {
      if (_isMapReady) {
        _mapController.move(userLocation, 15.5);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarForProfile(title: 'Address'),
        body: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter:
                    _currentLocation ?? const LatLng(34.730610, 36.708964),
                initialZoom: 15.5,
                onMapReady: () {
                  _isMapReady = true;
                },
                onTap: (tapPosition, point) {
                  setState(() {
                    _selectedPoint = point;
                  });
                },
              ),
              children: [
                TileLayer(
                  tileProvider: CancellableNetworkTileProvider(),
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                  userAgentPackageName: 'com.example.estatelqapp',
                ),

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

            /// زر الموقع الحالي
            Positioned(
              top: width * 0.11,
              right: width * 0.044,
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

            /// زر التأكيد
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
                  if (_selectedPoint != null) {
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please select a location")),
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

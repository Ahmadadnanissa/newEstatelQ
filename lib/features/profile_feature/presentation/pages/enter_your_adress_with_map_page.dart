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
    setState(() {
      _currentLocation = LatLng(pos.latitude, pos.longitude);
    });

    _mapController.move(_currentLocation!, 15.5);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBarForProfile(title: 'Address'),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter:
                  _currentLocation ?? const LatLng(34.730610, 36.708964),
              initialZoom: 15.5,
              onTap: (tapPosition, point) {
                setState(() {
                  _selectedPoint = point;
                });
                debugPrint(
                  "Selected point: ${point.latitude}, ${point.longitude}",
                );
              },
            ),
            children: [
              TileLayer(
                tileProvider: CancellableNetworkTileProvider(),
                urlTemplate:
                    'https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: [
                  if (_currentLocation != null)
                    Marker(
                      point: _currentLocation!,
                      child: Icon(
                        Icons.my_location,
                        color: Colors.blue,
                        size: width * 0.07,
                      ),
                    ),
                  if (_selectedPoint != null)
                    Marker(
                      point: _selectedPoint!,
                      child: Icon(
                        Icons.home,
                        color: secondaryColor,
                        size: width * 0.08,
                      ),
                    ),
                ],
              ),
            ],
          ),

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
              child: Icon(
                Icons.my_location,
                color: Colors.blue,
                size: width * 0.06,
              ),
            ),
          ),

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
                padding: EdgeInsets.symmetric(vertical: width * 0.03),
              ),
              onPressed: () {
                if (_selectedPoint != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Selected: ${_selectedPoint!.latitude.toString().substring(0, 8)}, ${_selectedPoint!.longitude}",
                      ),
                    ),
                  );
                }
              },
              child: Text(
                "Confirm Location",
                style: TextStyle(fontSize: width * 0.045, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

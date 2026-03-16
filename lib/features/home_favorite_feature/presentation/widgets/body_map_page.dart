import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class BodyMapPage extends StatefulWidget {
  const BodyMapPage({super.key});

  @override
  State<BodyMapPage> createState() => _BodyMapPageState();
}

class _BodyMapPageState extends State<BodyMapPage> {
  List<Map<String, dynamic>> properties = [];

  final MapController _mapController = MapController();
  LatLng? _currentLocation;
  Map<String, dynamic>? _nearestProperty;

  double _currentZoom = 15.5;
  StreamSubscription<Position>? _positionStreamSubscription;

  List<LatLng> _routePolyline = [];

  // 🎯 Filters
  RangeValues priceRange = const RangeValues(0, 100000);
  RangeValues areaRange = const RangeValues(50, 300);
  int? selectedRooms;
  int? selectedBathrooms;
  String? selectedType;

  // 🔎 Syrian Cities
  final Map<String, LatLng> syrianCities = {
    'حمص': LatLng(34.7308, 36.7092),
    'دمشق': LatLng(33.5138, 36.2765),
    'حلب': LatLng(36.2021, 37.1343),
    'طرطوس': LatLng(34.8859, 35.8862),
    'اللاذقية': LatLng(35.5311, 35.7767),
    'حماه': LatLng(35.1318, 36.7578),
  };

  TextEditingController citySearchController = TextEditingController();
  List<String> citySuggestions = [];

  @override
  void initState() {
    super.initState();
    generateDummyProperties();
    _startLocationUpdates();
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    super.dispose();
  }

  // 🔥 Dummy Data
  void generateDummyProperties() {
    properties = List.generate(10, (index) {
      return {
        'title': 'Property ${index + 1}',
        'position': LatLng(34.73 + (index * 0.001), 36.70 + (index * 0.001)),
        'price': 20000 + (index * 5000),
        'rooms': (index % 5) + 1,
        'bathrooms': (index % 3) + 1,
        'area': 80 + (index * 20),
        'type': index % 2 == 0 ? 'sale' : 'rent',
      };
    });
  }

  // 📍 Location
  Future<void> _startLocationUpdates() async {
    if (!await Geolocator.isLocationServiceEnabled()) return;

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    final pos = await Geolocator.getCurrentPosition();
    _currentLocation = LatLng(pos.latitude, pos.longitude);

    await _findNearestAndRoute();

    _positionStreamSubscription = Geolocator.getPositionStream().listen((
      pos,
    ) async {
      _currentLocation = LatLng(pos.latitude, pos.longitude);

      if (_nearestProperty != null) {
        final route = await getRoutePoints(
          _currentLocation!,
          _nearestProperty!['position'],
        );

        setState(() {
          _routePolyline = route;
        });
      }
    });
  }

  // 🔍 nearest
  Future<void> _findNearestAndRoute() async {
    if (_currentLocation == null) return;

    double minDistance = double.infinity;
    Map<String, dynamic>? nearest;

    for (var p in getFilteredProperties()) {
      double d = const Distance().as(
        LengthUnit.Meter,
        _currentLocation!,
        p['position'],
      );

      if (d < minDistance) {
        minDistance = d;
        nearest = p;
      }
    }

    if (nearest != null) {
      _nearestProperty = nearest;

      final route = await getRoutePoints(
        _currentLocation!,
        nearest['position'],
      );

      setState(() {
        _routePolyline = route;
      });

      _mapController.move(nearest['position'], _currentZoom);
    }
  }

  // 🚗 Route
  Future<List<LatLng>> getRoutePoints(LatLng start, LatLng end) async {
    try {
      const apiKey = '5b3ce3597851110001cf6248b00259a731264d43b4008a46b4ad9ba0';
      final url =
          'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}';

      final res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        final coords = data['features'][0]['geometry']['coordinates'];

        return coords.map<LatLng>((c) => LatLng(c[1], c[0])).toList();
      }
    } catch (e) {}

    return [start, end]; // fallback
  }

  // 🎯 Filter Logic
  List<Map<String, dynamic>> getFilteredProperties() {
    return properties.where((p) {
      return (p['price'] >= priceRange.start && p['price'] <= priceRange.end) &&
          (selectedRooms == null || p['rooms'] >= selectedRooms!) &&
          (selectedBathrooms == null || p['bathrooms'] >= selectedBathrooms!) &&
          (p['area'] >= areaRange.start && p['area'] <= areaRange.end) &&
          (selectedType == null || p['type'] == selectedType);
    }).toList();
  }

  // 🔎 Update suggestions
  void updateCitySuggestions(String query) {
    if (query.isEmpty) {
      setState(() => citySuggestions = []);
      return;
    }
    final suggestions = syrianCities.keys
        .where((city) => city.contains(query))
        .toList();
    setState(() => citySuggestions = suggestions);
  }

  @override
  Widget build(BuildContext context) {
    final filtered = getFilteredProperties();
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _currentLocation ?? const LatLng(34.73, 36.70),
              initialZoom: 15.5,
            ),
            children: [
              TileLayer(
                tileProvider: CancellableNetworkTileProvider(),
                urlTemplate:
                    'https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',
              ),

              // 📍 Markers
              MarkerLayer(
                markers: [
                  if (_currentLocation != null)
                    Marker(
                      point: _currentLocation!,
                      width: 40,
                      height: 40,
                      child: const Icon(Icons.my_location, color: Colors.blue),
                    ),
                  ...filtered.map((p) {
                    return Marker(
                      point: p['position'],
                      width: 60,
                      height: 60,
                      child: GestureDetector(
                        onTap: () {
                          _mapController.move(p['position'], _currentZoom);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.home, color: Colors.blue),
                            Container(
                              padding: const EdgeInsets.all(2),
                              color: Colors.white,
                              child: Text(
                                "\$${p['price']}",
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),

              // 🟣 Route
              if (_routePolyline.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: _routePolyline,
                      strokeWidth: 4,
                      color: Colors.purple,
                    ),
                  ],
                ),
            ],
          ),

          // 🔎 Search Box with Autocomplete
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: citySearchController,
                    decoration: InputDecoration(
                      hintText: "Search with location",
                      border: InputBorder.none,
                    ),
                    onChanged: updateCitySuggestions,
                  ),
                ),
                if (citySuggestions.isNotEmpty)
                  Container(
                    color: Colors.white,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: citySuggestions.length,
                      itemBuilder: (context, index) {
                        String city = citySuggestions[index];
                        return ListTile(
                          title: Text(city),
                          onTap: () {
                            _mapController.move(syrianCities[city]!, 13);
                            citySearchController.text = city;
                            setState(() => citySuggestions = []);
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),

          // 🔵 My Location
          Positioned(
            top: 140,
            right: 10,
            child: FloatingActionButton(
              mini: true,
              onPressed: () {
                if (_currentLocation != null) {
                  _mapController.move(_currentLocation!, _currentZoom);
                }
              },
              child: const Icon(Icons.my_location),
            ),
          ),

          // 🔴 Nearest
          Positioned(
            top: 200,
            right: 10,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.red,
              onPressed: () async {
                await _findNearestAndRoute();
              },
              child: const Icon(Icons.near_me),
            ),
          ),

          // 🎛️ Filters UI
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.15,
            maxChildSize: 0.6,
            builder: (context, controller) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: ListView(
                  controller: controller,
                  children: [
                    const Text("Filters"),

                    DropdownButton<int>(
                      hint: const Text("Rooms"),
                      value: selectedRooms,
                      items: [1, 2, 3, 4, 5]
                          .map(
                            (e) =>
                                DropdownMenuItem(value: e, child: Text("$e+")),
                          )
                          .toList(),
                      onChanged: (val) => setState(() => selectedRooms = val),
                    ),

                    DropdownButton<int>(
                      hint: const Text("Bathrooms"),
                      value: selectedBathrooms,
                      items: [1, 2, 3]
                          .map(
                            (e) =>
                                DropdownMenuItem(value: e, child: Text("$e+")),
                          )
                          .toList(),
                      onChanged: (val) =>
                          setState(() => selectedBathrooms = val),
                    ),

                    DropdownButton<String>(
                      hint: const Text("Type"),
                      value: selectedType,
                      items: ['sale', 'rent']
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (val) => setState(() => selectedType = val),
                    ),

                    const SizedBox(height: 10),

                    const Text("Price"),
                    RangeSlider(
                      min: 0,
                      max: 100000,
                      values: priceRange,
                      onChanged: (values) =>
                          setState(() => priceRange = values),
                    ),

                    const Text("Area"),
                    RangeSlider(
                      min: 50,
                      max: 300,
                      values: areaRange,
                      onChanged: (values) => setState(() => areaRange = values),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

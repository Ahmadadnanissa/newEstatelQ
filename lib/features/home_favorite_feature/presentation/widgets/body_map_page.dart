import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Property {
  final double latitude;
  final double longitude;
  final String title;
  final String price;

  Property({
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.price,
  });
}

class BodyMapPage extends StatefulWidget {
  const BodyMapPage({super.key});

  @override
  State<BodyMapPage> createState() => _BodyMapPageState();
}

class _BodyMapPageState extends State<BodyMapPage>
    with SingleTickerProviderStateMixin {
  List<Property> properties = [
    Property(
      latitude: 33.5,
      longitude: 36.3,
      title: "Modern Apartment",
      price: "\$200,000",
    ),
    Property(
      latitude: 33.51,
      longitude: 36.31,
      title: "Luxury Villa",
      price: "\$500,000",
    ),
  ];

  Property? selectedProperty;

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // ✅ ضبط fade animation بشكل آمن
    _fadeAnimation = _controller.drive(
      Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.easeIn)),
    );
  }

  void _onMarkerTap(Property property) {
    setState(() {
      selectedProperty = property;
      _controller.forward();
    });
  }

  void _hideCard() {
    _controller.reverse().then((_) {
      if (mounted) {
        setState(() {
          selectedProperty = null;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(33.5, 36.3),
              zoom: 13.0,
              onTap: (_, __) {
                if (selectedProperty != null) _hideCard();
              },
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                // حذف subdomains لتجنب تحذيرات OSM
              ),
              MarkerLayer(
                markers: properties.map((property) {
                  return Marker(
                    point: LatLng(property.latitude, property.longitude),
                    width: 50,
                    height: 50,
                    child: GestureDetector(
                      onTap: () => _onMarkerTap(property),
                      child: const Icon(
                        Icons.location_on,
                        size: 40,
                        color: Colors.red,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          if (selectedProperty != null)
            Positioned(
              bottom: screenHeight * 0.05,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedProperty!.title,
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            "Location: ${selectedProperty!.latitude.toStringAsFixed(4)}, ${selectedProperty!.longitude.toStringAsFixed(4)}",
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            "Price: ${selectedProperty!.price}",
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w500,
                              color: Colors.green[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

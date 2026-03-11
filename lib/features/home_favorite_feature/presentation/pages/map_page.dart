import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/body_map_page.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});
  static String id = 'MapPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BodyMapPage());
  }
}

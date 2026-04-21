import 'package:estatelqapp/core/widgets/app_image.dart';
import 'package:flutter/material.dart';

class CustomImageForBeds extends StatelessWidget {
  const CustomImageForBeds({super.key, required this.image});
  final String image;
  @override
  build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(width * 0.01),
      child: AppImage(
        path: image,
        width: width * 0.3,
        height: width * 0.35,
        fit: BoxFit.cover,
      ),
    );
  }
}

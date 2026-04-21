import 'package:estatelqapp/core/widgets/app_image.dart';
import 'package:flutter/material.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AppImage(
      path: 'assets/images/jesse-collins-LUitWpwc008-unsplash.jpg',
      width: width,
      height: height * 0.55,
      fit: BoxFit.cover,
    );
  }
}

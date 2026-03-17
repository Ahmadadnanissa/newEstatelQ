import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class PropertyImage extends StatelessWidget {
  const PropertyImage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(
          'assets/images/jesse-collins-LUitWpwc008-unsplash.jpg',
          width: width,
          height: height * 0.55,
          fit: BoxFit.cover,
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.arrow_back, color: blackColor, size: width * 0.07),

              Spacer(),
              Icon(Icons.share, size: width * 0.09),
              Icon(Icons.favorite, color: Colors.red, size: width * 0.09),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/app_image.dart';
import 'package:flutter/material.dart';

class PropertyImage extends StatelessWidget {
  const PropertyImage({super.key, required this.primaryImage});
  final String primaryImage;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        AppImage(
          path: primaryImage,
          width: width,
          height: height * 0.55,
          fit: BoxFit.cover,
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                  size: width * 0.07,
                ),
              ),

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

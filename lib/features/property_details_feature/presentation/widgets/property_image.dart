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

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),

            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },

                  child: Container(
                    padding: const EdgeInsets.all(8),

                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.25),

                      shape: BoxShape.circle,
                    ),

                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,

                      color: Colors.white,

                      size: width * 0.05,
                    ),
                  ),
                ),

                const Spacer(),

                Container(
                  padding: const EdgeInsets.all(8),

                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.25),

                    shape: BoxShape.circle,
                  ),

                  child: Icon(
                    Icons.share_outlined,

                    color: Colors.white,

                    size: width * 0.06,
                  ),
                ),

                SizedBox(width: width * 0.03),

                Container(
                  padding: const EdgeInsets.all(8),

                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.25),

                    shape: BoxShape.circle,
                  ),

                  child: Icon(
                    Icons.favorite_rounded,

                    color: Colors.red,

                    size: width * 0.06,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: file_names

import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainerForBRS extends StatelessWidget {
  const CustomContainerForBRS({
    super.key,
    required this.image,
    required this.name,
    required this.widthOfContainer,
    required this.color,
  });

  final String image;
  final String name;
  final double widthOfContainer;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: width * widthOfContainer,
      height: width * widthOfContainer,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.05),

        // ================= BACKGROUND =================
        color: Theme.of(context).cardColor,

        // ================= BORDER =================
        border: Border.all(width: width * 0.005, color: color),

        // ================= SHADOW =================
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.15)
                : Colors.black.withValues(alpha: 0.08),
            offset: const Offset(0, 3),
            blurRadius: 10,
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ================= IMAGE =================
          Image.asset(image, width: width * 0.18, height: width * 0.18),

          SizedBox(height: width * 0.015),

          // ================= TEXT =================
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: fontFamily,

              // النص صار مرتبط بالثيم
              color: Theme.of(context).colorScheme.onSurface,

              fontSize: width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

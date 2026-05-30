import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SecondaryButton extends StatefulWidget {
  SecondaryButton({super.key, required this.name, required this.pushing});

  String name;

  Function() pushing;

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  double scale = 1;
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    Future<void> onTap() async {
      setState(() {
        opacity = 0.75;
        scale = 0.95;
      });

      await Future.delayed(const Duration(milliseconds: 120));

      setState(() {
        opacity = 1;
        scale = 1;
      });

      widget.pushing();
    }

    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.02),

      child: GestureDetector(
        onTap: onTap,

        onTapDown: (details) {
          setState(() {
            scale = 0.95;
            opacity = 0.75;
          });
        },

        onTapUp: (details) {
          setState(() {
            scale = 1;
            opacity = 1;
          });
        },

        onTapCancel: () {
          setState(() {
            scale = 1;
            opacity = 1;
          });
        },

        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 150),

          child: AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 150),

            child: Container(
              height: width * 0.13,
              width: width * 0.85,

              decoration: BoxDecoration(
                // الزر الثانوي صار ديناميك
                color: Theme.of(context).cardColor,

                borderRadius: BorderRadius.circular(width * 0.07),

                border: Border.all(color: secondaryColor, width: 1.2),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.10 : 0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Center(
                child: Text(
                  widget.name,
                  style: TextStyle(
                    // نص ديناميك حسب الثيم
                    color: Theme.of(context).colorScheme.onSurface,

                    fontFamily: fontFamily,

                    fontWeight: FontWeight.w600,

                    fontSize: width * 0.055,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

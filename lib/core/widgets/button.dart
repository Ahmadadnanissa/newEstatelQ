import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatefulWidget {
  PrimaryButton({
    super.key,
    required this.name,
    required this.pushing,
    this.isLoading = false,
  });

  String name;

  Future<void> Function() pushing;

  final bool isLoading;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  double scale = 1;
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Future<void> onTap() async {
      setState(() {
        opacity = 0.85;
        scale = 0.95;
      });

      await Future.delayed(const Duration(milliseconds: 120));

      setState(() {
        opacity = 1;
        scale = 1;
      });

      await widget.pushing();
    }

    return GestureDetector(
      onTap: onTap,

      onTapDown: (details) {
        setState(() {
          scale = 0.95;
          opacity = 0.85;
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
              color: secondaryColor,

              borderRadius: BorderRadius.circular(width * 0.07),

              border: Border.all(color: secondaryColor, width: 1),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),

            child: widget.isLoading
                ? Center(
                    child: SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: primaryColor,
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        color: primaryColor,

                        fontFamily: fontFamily,

                        fontWeight: FontWeight.w600,

                        fontSize: width * 0.055,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

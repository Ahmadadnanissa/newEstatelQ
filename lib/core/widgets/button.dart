import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatefulWidget {
  PrimaryButton({super.key, required this.name, required this.pushing});
  String name;
  Function() pushing;

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
        opacity = 0.8;
        scale = 0.9;
      });

      await Future.delayed(const Duration(milliseconds: 150));

      setState(() {
        opacity = 1;
        scale = 1;
      });
      await Future.delayed(const Duration(milliseconds: 150));

      widget.pushing();
    }

    return GestureDetector(
      onTap: onTap,
      onTapDown: (details) {
        setState(() {
          scale = 0.9;
          opacity = 0.8;
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
        duration: const Duration(milliseconds: 175),
        child: AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 175),
          child: Container(
            height: width * 0.13,
            width: width * 0.85,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(width * 0.07),
              border: Border.all(
                color: Color(0xff2B282B),
                width: 1,
                style: BorderStyle.solid,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 2,
                  offset: Offset(0.5, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    color: primaryColor,
                    fontFamily: fontFamily,
                    fontSize: width * 0.07,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

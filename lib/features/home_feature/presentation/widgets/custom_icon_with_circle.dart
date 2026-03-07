import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIconWithCircle extends StatefulWidget {
  CustomIconWithCircle({
    super.key,
    required this.icon,
    required this.containerColor,
  });
  Widget icon;

  Color? containerColor;
  @override
  State<CustomIconWithCircle> createState() => _CustomIconWithCircleState();
}

class _CustomIconWithCircleState extends State<CustomIconWithCircle> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.11,
      height: width * 0.11,
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: BorderRadius.circular(width * 0.3),
      ),

      child: Center(child: widget.icon),
    );
  }
}

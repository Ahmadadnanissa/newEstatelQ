import 'package:flutter/material.dart';

class OtpCircle extends StatefulWidget {
  const OtpCircle({super.key});

  @override
  State<OtpCircle> createState() => _OtpCircleState();
}

class _OtpCircleState extends State<OtpCircle> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.15,
      height: width * 0.15,
      decoration: BoxDecoration(
        color: Color(0xff83C5BE),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

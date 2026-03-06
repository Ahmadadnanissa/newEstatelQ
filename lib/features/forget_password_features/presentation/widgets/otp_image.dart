import 'package:flutter/material.dart';

class OtpImage extends StatelessWidget {
  const OtpImage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width * 0.8,
          height: width * 0.6,
          child: Image.asset(
            'assets/images/otp.png',
            width: width * 0.8,
            height: width * 0.6,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

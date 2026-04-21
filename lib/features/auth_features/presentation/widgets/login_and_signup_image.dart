import 'package:estatelqapp/core/widgets/app_image.dart';
import 'package:flutter/material.dart';

class LoginAndSignupImage extends StatelessWidget {
  const LoginAndSignupImage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width * 0.8,
          height: width * 0.6,
          child: AppImage(
            path: 'assets/images/Rectangle 102.png',
            width: width * 0.8,
            height: width * 0.6,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

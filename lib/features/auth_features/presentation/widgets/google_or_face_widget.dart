import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/auth_features/data/repositories/auth_repository.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/google_sign_in_use_case.dart';
import 'package:flutter/material.dart';

class GoogleOrFaceWidget extends StatefulWidget {
  const GoogleOrFaceWidget({super.key});

  @override
  State<GoogleOrFaceWidget> createState() => _GoogleOrFaceWidgetState();
}

class _GoogleOrFaceWidgetState extends State<GoogleOrFaceWidget> {
  final GoogleSignInUseCase useCase = GoogleSignInUseCase(AuthRepository());

  void _handleGoogleSignIn() async {
    final idToken = await useCase.execute();

    if (idToken != null) {
      // ignore: avoid_print
      print('Google ID Token: $idToken');
    } else {
      // ignore: avoid_print
      print('User cancelled or failed to sign in');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              _handleGoogleSignIn();
            },
            focusColor: Color(0xffEDF6F9),
            hoverColor: Color(0xffEDF6F9),
            splashColor: Color(0xffEDF6F9),
            highlightColor: Color(0xffEDF6F9),

            borderRadius: BorderRadius.circular(width * 0.07),
            child: Container(
              width: width * 0.2,
              height: width * 0.15,
              decoration: BoxDecoration(
                color: Color(0xffEDF6F9),
                borderRadius: BorderRadius.circular(width * 0.07),
              ),
              child: Image.asset('assets/images/Google.png'),
            ),
          ),
          Container(
            width: width * 0.2,
            height: width * 0.15,
            decoration: BoxDecoration(
              color: greenColor,
              borderRadius: BorderRadius.circular(width * 0.07),
            ),
            child: Icon(
              Icons.facebook_sharp,
              color: Colors.blue,
              size: width * 0.1,
            ),
          ),
        ],
      ),
    );
  }
}

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

  bool isLoading = false;

  void _handleGoogleSignIn() async {
    setState(() => isLoading = true);

    final idToken = await useCase.execute();

    setState(() => isLoading = false);

    if (idToken != null) {
      print('Success Success Success Success Success Success');

      print(
        'Success Success Success Success Success Success idToken : $idToken',
      );

      // await context.read<AuthProvider>()
      // .loginWithGoogle(idToken);
    } else {
      print('Failed Failed Failed Failed Failed Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.1),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          // ================= GOOGLE =================
          InkWell(
            onTap: () {
              _handleGoogleSignIn();
            },

            focusColor: Theme.of(context).cardColor,

            hoverColor: Theme.of(context).cardColor,

            splashColor: Theme.of(context).cardColor,

            highlightColor: Theme.of(context).cardColor,

            borderRadius: BorderRadius.circular(width * 0.07),

            child: Container(
              width: width * 0.2,
              height: width * 0.15,

              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,

                borderRadius: BorderRadius.circular(width * 0.07),

                border: Border.all(
                  color: isDark ? darkSurfaceColor : const Color(0xffE5F0F4),
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.10 : 0.05),

                    blurRadius: 8,

                    offset: const Offset(0, 3),
                  ),
                ],
              ),

              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: secondaryColor),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset('assets/images/Google.png'),
                    ),
            ),
          ),

          // ================= FACEBOOK =================
          Container(
            width: width * 0.2,
            height: width * 0.15,

            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,

              borderRadius: BorderRadius.circular(width * 0.07),

              border: Border.all(
                color: isDark ? darkSurfaceColor : const Color(0xffE5F0F4),
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.10 : 0.05),

                  blurRadius: 8,

                  offset: const Offset(0, 3),
                ),
              ],
            ),

            child: Icon(
              Icons.facebook_rounded,

              color: const Color(0xff1877F2),

              size: width * 0.09,
            ),
          ),
        ],
      ),
    );
  }
}

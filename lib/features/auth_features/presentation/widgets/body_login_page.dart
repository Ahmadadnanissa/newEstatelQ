import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/signup_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/final_double_text_for_login.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/forget_your_password.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/google_or_face_widget.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/login_and_signup_image.dart';
import 'package:estatelqapp/core/widgets/name_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/or_continue_with.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/row_for_navigation_between_login_and_signup.dart';
import 'package:flutter/material.dart';

class BodyLoginPage extends StatefulWidget {
  const BodyLoginPage({super.key});

  @override
  State<BodyLoginPage> createState() => _BodyLoginPageState();
}

class _BodyLoginPageState extends State<BodyLoginPage> {
  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            LoginAndSignupImage(),
            NamePage(name: 'Login'),
            RowForNavigationBetweenLoginAndSignup(
              subTitle: 'Don’t Have An Account?',
              name: 'Signup',
              onTap: () {
                Navigator.pushNamed(context, SignupPage.id);
              },
            ),
            FinalDoubleTextForLogin(),
            ForgetYourPassword(),
            PrimaryButton(
              name: 'Login',
              pushing: () {
                if (globalKey.currentState!.validate()) {}
              },
            ),
            OrContinueWith(),
            GoogleOrFaceWidget(),
          ],
        ),
      ),
    );
  }
}

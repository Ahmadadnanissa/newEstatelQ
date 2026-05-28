import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/custom_message.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/signup_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/state_management/auth_provider.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/final_double_text_for_login.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/forget_your_password.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/google_or_face_widget.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/login_and_signup_image.dart';
import 'package:estatelqapp/core/widgets/name_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/or_continue_with.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/row_for_navigation_between_login_and_signup.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyLoginPage extends StatefulWidget {
  const BodyLoginPage({super.key});

  @override
  State<BodyLoginPage> createState() => _BodyLoginPageState();
}

class _BodyLoginPageState extends State<BodyLoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();

    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
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
                  Navigator.pushReplacementNamed(context, SignupPage.id);
                },
              ),

              FinalDoubleTextForLogin(
                emailController: emailController,

                passwordController: passwordController,
              ),

              ForgetYourPassword(),

              Consumer<AuthProvider>(
                builder: (context, provider, _) {
                  return PrimaryButton(
                    name: "Login",

                    isLoading: provider.isLoading,

                    pushing: () async {
                      FocusScope.of(context).unfocus();

                      if (!globalKey.currentState!.validate()) {
                        return;
                      }

                      final email = emailController.text.trim();

                      final password = passwordController.text.trim();

                      final authProvider = context.read<AuthProvider>();

                      await authProvider.login(email, password);

                      if (authProvider.error != null) {
                        CustomMessage.error(context, authProvider.error!);

                        return;
                      }

                      if (authProvider.userData != null) {
                        CustomMessage.success(
                          context,
                          authProvider.userData?.message ?? "Welcome back!",
                        );

                        emailController.clear();

                        passwordController.clear();

                        Navigator.pushReplacement(
                          context,
                          SlideRight(page: HomePage()),
                        );
                      }
                    },
                  );
                },
              ),

              // OrContinueWith(),
              // GoogleOrFaceWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

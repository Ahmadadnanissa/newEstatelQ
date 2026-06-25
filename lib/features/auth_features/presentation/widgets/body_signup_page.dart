import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/custom_message.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/login_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/state_management/auth_provider.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/custom_field_name_and_email.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/custom_field_password_double.dart';

// import 'package:estatelqapp/features/auth_features/presentation/widgets/custom_text_form_field_for_number.dart';

import 'package:estatelqapp/features/auth_features/presentation/widgets/google_or_face_widget.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/login_and_signup_image.dart';
import 'package:estatelqapp/core/widgets/name_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/or_continue_with.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/row_for_navigation_between_login_and_signup.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/pages/otp_verifivcation_page_for_password.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodySignupPage extends StatefulWidget {
  const BodySignupPage({super.key});

  @override
  State<BodySignupPage> createState() => _BodySignupPageState();
}

class _BodySignupPageState extends State<BodySignupPage> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final nameController = TextEditingController();

  // final phoneController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    passwordController.dispose();

    confirmPasswordController.dispose();

    nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Form(
        key: globalKey,

        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),

            child: Column(
              children: [
                // ================= IMAGE =================
                const LoginAndSignupImage(),

                // ================= TITLE =================
                NamePage(name: 'Signup'),

                // ================= NAVIGATION =================
                RowForNavigationBetweenLoginAndSignup(
                  subTitle: 'Already Have An Acount? ',

                  name: 'Login',

                  onTap: () {
                    Navigator.pushReplacementNamed(context, LoginPage.id);
                  },
                ),

                // ================= NAME + EMAIL =================
                CustomFieldNameAndEmail(
                  emailController: emailController,

                  nameController: nameController,
                ),

                // ================= PHONE =================

                // CustomTextFormFieldForNumber(
                //   phoneController: phoneController,
                // ),

                // ================= PASSWORD =================
                CustomFieldPasswordDouble(
                  passwordController: passwordController,

                  confirmPasswordController: confirmPasswordController,
                ),

                SizedBox(height: 30),

                // ================= BUTTON =================
                Consumer<AuthProvider>(
                  builder: (context, provider, _) {
                    return PrimaryButton(
                      name: "SignUp",

                      isLoading: provider.isLoading,

                      pushing: () async {
                        FocusScope.of(context).unfocus();

                        if (!globalKey.currentState!.validate()) {
                          return;
                        }

                        final email = emailController.text.trim();

                        final name = nameController.text.trim();

                        final password = passwordController.text.trim();

                        final confirmPassword = confirmPasswordController.text
                            .trim();

                        final authProvider = context.read<AuthProvider>();

                        await authProvider.signup(
                          name,
                          email,
                          password,
                          confirmPassword,
                        );
                        if (!mounted) return;
                        if (authProvider.error != null) {
                          CustomMessage.error(context, authProvider.error!);

                          return;
                        }

                        if (authProvider.signupData != null) {
                          CustomMessage.success(
                            context,
                            authProvider.signupData?.message ??
                                "Account created successfully",
                          );

                          nameController.clear();

                          emailController.clear();

                          passwordController.clear();

                          confirmPasswordController.clear();

                          Navigator.pushReplacement(
                            context,
                            SlideRight(
                              page: OtpVerifivcationPageForPassword(
                                email: email,
                                toCreateAccount: true,
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),

                SizedBox(height: 20),

                // ================= CONTINUE WITH =================
                const OrContinueWith(),

                SizedBox(height: 15),

                // ================= SOCIAL =================
                // const GoogleOrFaceWidget(),
                SizedBox(height: isDark ? 25 : 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
  GlobalKey<FormState> globalKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  // final phoneController = TextEditingController();

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
              NamePage(name: 'Signup'),
              RowForNavigationBetweenLoginAndSignup(
                subTitle: 'Already Have An Acount? ',
                name: 'Login',
                onTap: () {
                  Navigator.pushReplacementNamed(context, LoginPage.id);
                },
              ),
              CustomFieldNameAndEmail(
                emailController: emailController,
                nameController: nameController,
              ),
              //   CustomTextFormFieldForNumber(phoneController: phoneController),
              CustomFieldPasswordDouble(
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
              ),
              SizedBox(height: 30),

              Consumer<AuthProvider>(
                builder: (context, provider, _) {
                  return PrimaryButton(
                    name: "SignUp",

                    isLoading: provider.isLoading,

                    pushing: () async {
                      if (globalKey.currentState!.validate()) {
                        final email = emailController.text.trim();
                        // final phone = phoneController.text.trim();
                        final name = nameController.text.trim();
                        final password = passwordController.text.trim();
                        final confirmPassword = confirmPasswordController.text
                            .trim();

                        final provider = context.read<AuthProvider>();

                        await provider.signup(
                          name,
                          email,
                          password,
                          confirmPassword,
                        );
                        Navigator.pushReplacement(
                          context,
                          SlideRight(
                            page: OtpVerifivcationPageForPassword(
                              email: email,
                              toCreateAccount: true,
                            ),
                          ),
                        );

                        if (provider.signupData != null) {
                          CustomMessage.success(
                            context,
                            "Account created. OTP sent to your email.",
                          );
                          Navigator.pushReplacement(
                            context,
                            SlideRight(
                              page: OtpVerifivcationPageForPassword(
                                email: email,
                                toCreateAccount: true,
                              ),
                            ),
                          );

                          nameController.clear();
                          emailController.clear();
                          passwordController.clear();
                          confirmPasswordController.clear();
                        }

                        if (provider.error != null) {
                          CustomMessage.error(context, provider.error!);
                        }
                      }
                    },
                  );
                },
              ),

              OrContinueWith(),
              GoogleOrFaceWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

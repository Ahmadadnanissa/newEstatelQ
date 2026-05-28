import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/custom_message.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/login_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/state_management/auth_provider.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/widgets/change_password_image.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/widgets/custom_text_form_field_for_change_password.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyChangePasswordPage extends StatefulWidget {
  const BodyChangePasswordPage({super.key});

  @override
  State<BodyChangePasswordPage> createState() => _BodyChangePasswordPageState();
}

class _BodyChangePasswordPageState extends State<BodyChangePasswordPage> {
  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> globalKey = GlobalKey();

  @override
  void dispose() {
    passwordController.dispose();

    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Form(
      key: globalKey,

      child: SingleChildScrollView(
        child: Column(
          children: [
            ChangePasswordImage(),

            SizedBox(height: width * 0.06),

            CustomTextFieldForChangePassword(
              passwordController: passwordController,

              confirmPasswordController: confirmPasswordController,
            ),

            SizedBox(height: width * 0.85),

            Consumer<AuthProvider>(
              builder: (context, provider, _) {
                return PrimaryButton(
                  name: 'Done',

                  isLoading: provider.isLoading,

                  pushing: () async {
                    FocusScope.of(context).unfocus();

                    /// validate form
                    if (!globalKey.currentState!.validate()) {
                      return;
                    }

                    /// call api
                    await provider.resetPassword(
                      passwordController.text.trim(),

                      confirmPasswordController.text.trim(),
                    );

                    /// error
                    if (provider.error != null) {
                      CustomMessage.error(context, provider.error!);

                      return;
                    }

                    /// success
                    CustomMessage.success(
                      context,
                      "Password changed successfully",
                    );

                    /// navigate to login
                    Navigator.pushAndRemoveUntil(
                      context,

                      SlideRight(page: LoginPage()),

                      (route) => false,
                    );
                  },
                );
              },
            ),

            SizedBox(height: width * 0.03),
          ],
        ),
      ),
    );
  }
}

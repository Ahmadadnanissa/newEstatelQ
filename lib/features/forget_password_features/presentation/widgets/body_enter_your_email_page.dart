import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/custom_message.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/auth_features/presentation/state_management/auth_provider.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/pages/otp_verifivcation_page_for_password.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/widgets/enter_your_email_image.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/widgets/enter_your_name_descr.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/widgets/text_form_field_for_email.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyEnterYourEmailPage extends StatefulWidget {
  const BodyEnterYourEmailPage({super.key});

  @override
  State<BodyEnterYourEmailPage> createState() => _BodyEnterYourEmailPageState();
}

class _BodyEnterYourEmailPageState extends State<BodyEnterYourEmailPage> {
  final emailController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  void dispose() {
    emailController.dispose();
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
            EnterYourEmailImage(),
            EnterYourNameDescr(),
            TextFormFieldForEmail(emailController: emailController),
            SizedBox(height: width * 0.9),

            PrimaryButton(
              name: 'Next',
              pushing: () async {
                if (globalKey.currentState!.validate()) {
                  final provider = context.read<AuthProvider>();

                  await provider.forgotPassword(
                    context,
                    emailController.text.trim(),
                  );

                  if (provider.error != null) {
                    CustomMessage.error(context, provider.error!);

                    return;
                  }

                  Navigator.push(
                    context,
                    SlideRight(
                      page: OtpVerifivcationPageForPassword(
                        email: emailController.text.trim(),
                        toCreateAccount: false,
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: width * 0.02),
          ],
        ),
      ),
    );
  }
}

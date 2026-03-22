import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/pages/otp_verifivcation_page_for_password.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/widgets/enter_your_email_image.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/widgets/enter_your_name_descr.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/widgets/text_form_field_for_email.dart';
import 'package:flutter/material.dart';

class BodyEnterYourEmailPage extends StatefulWidget {
  const BodyEnterYourEmailPage({super.key});

  @override
  State<BodyEnterYourEmailPage> createState() => _BodyEnterYourEmailPageState();
}

class _BodyEnterYourEmailPageState extends State<BodyEnterYourEmailPage> {
  GlobalKey<FormState> globalKey = GlobalKey();
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
            TextFormFieldForEmail(),
            SizedBox(height: width * 0.9),

            PrimaryButton(
              name: 'Next',
              pushing: () {
                if (globalKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    SlideRight(page: OtpVerifivcationPageForPassword()),
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

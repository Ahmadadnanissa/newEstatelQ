import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/widgets/change_password_image.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/widgets/custom_text_form_field_for_change_password.dart';
import 'package:flutter/material.dart';

class BodyChangePasswordPage extends StatefulWidget {
  const BodyChangePasswordPage({super.key});

  @override
  State<BodyChangePasswordPage> createState() => _BodyChangePasswordPageState();
}

class _BodyChangePasswordPageState extends State<BodyChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          ChangePasswordImage(),
          SizedBox(height: width * 0.06),
          CustomTextFieldForChangePassword(),
          SizedBox(height: width * 0.4),
          PrimaryButton(name: 'Done', pushing: () {}),
        ],
      ),
    );
  }
}

import 'package:estatelqapp/features/auth_features/presentation/widgets/double_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomTextFieldForChangePassword extends StatefulWidget {
  const CustomTextFieldForChangePassword({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController passwordController;

  final TextEditingController confirmPasswordController;

  @override
  State<CustomTextFieldForChangePassword> createState() =>
      _CustomTextFieldForChangePasswordState();
}

class _CustomTextFieldForChangePasswordState
    extends State<CustomTextFieldForChangePassword> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return DoubleTextFormfield(
      controller1: widget.passwordController,

      controller2: widget.confirmPasswordController,

      obsecureText1: isHidden,

      obsecureText2: isHidden,

      text1: 'Enter New Password',

      text2: 'Confirm New Password',

      validator1: (data) {
        RegExp passwordRegex = RegExp(r'^[A-Za-z0-9._%+-@!#*$%]{6,}$');

        if (data == null || data.trim().isEmpty) {
          return 'Password is required';
        }

        if (!passwordRegex.hasMatch(data.trim())) {
          return 'Password must be at least 6 characters';
        }

        return null;
      },

      validator2: (data) {
        if (data == null || data.trim().isEmpty) {
          return 'Confirm password is required';
        }

        if (data.trim() != widget.passwordController.text.trim()) {
          return 'Passwords do not match';
        }

        return null;
      },

      onChanged1: (data) {},

      onChanged2: (data) {},

      icon1: GestureDetector(
        onTap: () {
          setState(() {
            isHidden = !isHidden;
          });
        },

        child: Icon(isHidden ? Icons.lock : Icons.lock_open),
      ),

      icon2: GestureDetector(
        onTap: () {
          setState(() {
            isHidden = !isHidden;
          });
        },

        child: Icon(isHidden ? Icons.lock : Icons.lock_open),
      ),
    );
  }
}

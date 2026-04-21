import 'package:estatelqapp/features/auth_features/presentation/widgets/double_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomFieldPasswordDouble extends StatefulWidget {
  const CustomFieldPasswordDouble({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
  });
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  @override
  State<CustomFieldPasswordDouble> createState() =>
      _CustomFieldPasswordDoubleState();
}

class _CustomFieldPasswordDoubleState extends State<CustomFieldPasswordDouble> {
  bool ishidden = true;
  String? password;

  @override
  Widget build(BuildContext context) {
    return DoubleTextFormfield(
      obsecureText1: ishidden,
      obsecureText2: ishidden,
      text1: 'passowrd',
      text2: 'confirm password',
      validator1: (data) {
        RegExp passwordRegex = RegExp(r'^[A-Za-z0-9._%+-@!#*$%]{6,}$');
        if (data!.isEmpty || !passwordRegex.hasMatch(data.trim())) {
          return 'password must be at least 6 digits';
        }
        return null;
      },
      validator2: (data) {
        if (data!.trim() != password) {
          return 'not the same password';
        }
        return null;
      },

      controller1: widget.passwordController,
      controller2: widget.confirmPasswordController,
      icon1: GestureDetector(
        onTap: () {
          setState(() {
            ishidden = !ishidden;
          });
        },
        child: ishidden ? Icon(Icons.lock) : Icon(Icons.lock_open),
      ),
      icon2: GestureDetector(
        onTap: () {
          setState(() {
            ishidden = !ishidden;
          });
        },
        child: ishidden ? Icon(Icons.lock) : Icon(Icons.lock_open),
      ),
    );
  }
}

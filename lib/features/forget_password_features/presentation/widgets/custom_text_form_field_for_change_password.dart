import 'package:estatelqapp/features/auth_features/presentation/widgets/double_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomTextFieldForChangePassword extends StatefulWidget {
  const CustomTextFieldForChangePassword({super.key});

  @override
  State<CustomTextFieldForChangePassword> createState() =>
      _CustomTextFieldForChangePasswordState();
}

class _CustomTextFieldForChangePasswordState
    extends State<CustomTextFieldForChangePassword> {
  bool ishidden = true;
  String? password;

  @override
  Widget build(BuildContext context) {
    return DoubleTextFormfield(
      obsecureText1: ishidden,
      obsecureText2: ishidden,
      text1: 'Enter New Password',
      text2: 'Enter  Confirm Password',
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
      onChanged1: (data) {
        password = data.trim();
      },
      onChanged2: (data) {},
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

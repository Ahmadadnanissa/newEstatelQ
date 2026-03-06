import 'package:estatelqapp/features/auth_features/presentation/widgets/double_text_form_field.dart';
import 'package:flutter/material.dart';

class FinalDoubleTextForLogin extends StatefulWidget {
  const FinalDoubleTextForLogin({super.key});

  @override
  State<FinalDoubleTextForLogin> createState() =>
      _FinalDoubleTextForLoginState();
}

class _FinalDoubleTextForLoginState extends State<FinalDoubleTextForLogin> {
  String? email, password;
  bool ishidden = true;
  @override
  Widget build(BuildContext context) {
    return DoubleTextFormfield(
      text1: 'Enter Your Email',
      text2: 'Enter Your Password',
      validator1: (data) {
        RegExp emailRegex = RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        );
        if (data!.isEmpty || !emailRegex.hasMatch(data.trim())) {
          return 'Email not valid';
        }
        return null;
      },
      validator2: (data) {
        RegExp passwordRegex = RegExp(r'^[A-Za-z0-9._%+-@!#*$%]{6,}$');
        if (data!.isEmpty || !passwordRegex.hasMatch(data.trim())) {
          return 'password must be at least 6 digits';
        }
        return null;
      },
      onChanged1: (data) {
        email = data.trim();
      },
      onChanged2: (data) {
        password = data.trim();
      },
      icon1: Icon(Icons.mail),
      icon2: GestureDetector(
        onTap: () {
          setState(() {
            ishidden = !ishidden;
          });
        },
        child: ishidden ? Icon(Icons.lock) : Icon(Icons.lock),
      ),
      obsecureText1: false,
      obsecureText2: ishidden,
    );
  }
}

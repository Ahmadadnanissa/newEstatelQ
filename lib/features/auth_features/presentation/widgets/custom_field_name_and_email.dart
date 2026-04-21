import 'package:estatelqapp/features/auth_features/presentation/widgets/double_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomFieldNameAndEmail extends StatefulWidget {
  const CustomFieldNameAndEmail({
    super.key,
    required this.emailController,
    required this.nameController,
  });
  final TextEditingController emailController;
  final TextEditingController nameController;
  @override
  State<CustomFieldNameAndEmail> createState() =>
      _CustomFieldNameAndEmailState();
}

class _CustomFieldNameAndEmailState extends State<CustomFieldNameAndEmail> {
  String? email, fullName;
  @override
  Widget build(BuildContext context) {
    return DoubleTextFormfield(
      controller1: widget.nameController,
      controller2: widget.emailController,
      text1: 'Enter Your Name',
      text2: 'Enter Your Email',
      validator1: (data) {
        RegExp fullNameRegex = RegExp(r'^[A-Za-z][A-Za-z ]{5,}$');
        if (data!.isEmpty || !fullNameRegex.hasMatch(data.trim())) {
          return 'name must be at least 6 digits';
        }
        return null;
      },
      validator2: (data) {
        RegExp emailRegex = RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        );
        if (data!.isEmpty || !emailRegex.hasMatch(data.trim())) {
          return 'Email not valid';
        }
        return null;
      },
      icon1: Icon(Icons.person),
      icon2: Icon(Icons.mail),
      obsecureText1: false,
      obsecureText2: false,
    );
  }
}

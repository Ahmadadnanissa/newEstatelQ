import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldForNumber extends StatefulWidget {
  const CustomTextFormFieldForNumber({super.key});

  @override
  State<CustomTextFormFieldForNumber> createState() =>
      _CustomTextFormFieldForNumberState();
}

class _CustomTextFormFieldForNumberState
    extends State<CustomTextFormFieldForNumber> {
  String? number;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        top: width * 0.03,
        left: width * 0.05,
        right: width * 0.05,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: blackColor.withValues(alpha: 0.2),
              offset: Offset(0, 3),
              blurRadius: 10,
            ),
          ],
        ),
        child: TextFormField(
          obscureText: false,
          validator: (data) {
            RegExp numberRegex = RegExp(r'^[A-Za-z][A-Za-z ]{10,}$');
            if (data!.isEmpty || !numberRegex.hasMatch(data.trim())) {
              return 'number must be 10 digits';
            }
            return null;
          },
          onChanged: (data) {
            number = data.trim();
          },
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: width * 0.035),
            fillColor: Color(0xffEDF6F9),
            filled: true,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: width * 0.02, right: width * 0.01),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.phone),
                color: secondaryColor,
              ),
            ),
            hintText: 'Enter Your Number',
            hintStyle: TextStyle(
              color: Color(0xff5F6264),
              fontFamily: fontFamily,
              fontSize: width * 0.04,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              borderSide: BorderSide(color: Color(0xffE5F0F4), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              borderSide: BorderSide(color: Color(0xffE5F0F4), width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              borderSide: BorderSide(color: Color(0xffE5F0F4), width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              borderSide: BorderSide(color: Color(0xffE5F0F4), width: 1),
            ),
          ),
        ),
      ),
    );
  }
}

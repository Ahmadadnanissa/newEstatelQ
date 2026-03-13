import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormFieldForString extends StatelessWidget {
  CustomTextFormFieldForString({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.validator,
    required this.icon,
  });
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  String hintText;
  Icon icon;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.45,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            offset: Offset(0, 3),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: width * 0.035),
          fillColor: primaryColor,
          filled: true,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: width * 0.02, right: width * 0.01),
            child: icon,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xff5F6264),
            fontFamily: fontFamily,
            fontSize: width * 0.035,
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
    );
  }
}

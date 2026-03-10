import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class FormFieldForDescribeIssue extends StatefulWidget {
  const FormFieldForDescribeIssue({super.key});

  @override
  State<FormFieldForDescribeIssue> createState() =>
      _FormFieldForDescribeIssueState();
}

class _FormFieldForDescribeIssueState extends State<FormFieldForDescribeIssue> {
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
            if (data!.isEmpty) {
              return 'required field';
            }
            return null;
          },
          onChanged: (data) {
            number = data.trim();
          },
          maxLines: 3,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: width * 0.035),
            fillColor: primaryColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              borderSide: BorderSide(color: blackColor, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              borderSide: BorderSide(color: blackColor, width: 0.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              borderSide: BorderSide(color: blackColor, width: 0.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              borderSide: BorderSide(color: blackColor, width: 0.5),
            ),
          ),
        ),
      ),
    );
  }
}

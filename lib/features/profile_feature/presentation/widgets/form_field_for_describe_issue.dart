import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class FormFieldForDescribeIssue extends StatelessWidget {
  final TextEditingController controller;

  const FormFieldForDescribeIssue({super.key, required this.controller});

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
              offset: const Offset(0, 3),
              blurRadius: 10,
            ),
          ],
        ),

        child: TextFormField(
          controller: controller,

          validator: (data) {
            if (data == null || data.isEmpty) {
              return 'required field';
            }
            return null;
          },

          maxLines: 3,

          textAlign: TextAlign.start,

          textAlignVertical: TextAlignVertical.center,

          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: width * 0.035),

            fillColor: primaryColor,
            filled: true,

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),

              borderSide: BorderSide(color: blackColor, width: 0.5),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),

              borderSide: BorderSide(color: blackColor, width: 0.5),
            ),
          ),
        ),
      ),
    );
  }
}

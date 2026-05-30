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

    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: width * 0.45,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.15),
            offset: const Offset(0, 3),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,

        style: TextStyle(color: colorScheme.onSurface),

        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: width * 0.035),

          filled: true,
          fillColor: colorScheme.surface,

          prefixIcon: Padding(
            padding: EdgeInsets.only(left: width * 0.02, right: width * 0.01),
            child: IconTheme(
              data: IconThemeData(color: colorScheme.primary),
              child: icon,
            ),
          ),

          hintText: hintText,
          hintStyle: TextStyle(
            color: colorScheme.onSurface.withValues(alpha: 0.5),
            fontSize: width * 0.035,
          ),

          // unified border (no duplication)
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: colorScheme.primary, width: 1.2),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: colorScheme.error),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: colorScheme.error, width: 1.2),
          ),
        ),
      ),
    );
  }
}

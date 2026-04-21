import 'package:flutter/material.dart';
import 'package:estatelqapp/core/app_theme.dart';

class SelectRequestType extends StatelessWidget {
  const SelectRequestType({
    super.key,
    required this.requestTypes,
    required this.hintText,
    required this.selectedValue,
    required this.onChanged,
  });

  final List<String> requestTypes;
  final String hintText;
  final String selectedValue;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.02),
      child: DropdownMenu<String>(
        initialSelection: selectedValue,
        hintText: hintText,
        width: width * 0.45,
        textStyle: TextStyle(fontSize: width * 0.035),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: primaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: blackColor, width: 0.5),
          ),
        ),

        onSelected: (value) {
          if (value != null) {
            onChanged(value);
          }
        },

        dropdownMenuEntries: requestTypes.map((type) {
          return DropdownMenuEntry(value: type, label: type);
        }).toList(),
      ),
    );
  }
}

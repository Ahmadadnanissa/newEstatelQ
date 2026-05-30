import 'package:flutter/material.dart';

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
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.02),
      child: DropdownMenu<String>(
        initialSelection: selectedValue,
        hintText: hintText,
        width: width * 0.45,

        textStyle: TextStyle(
          fontSize: width * 0.035,
          color: colorScheme.onSurface,
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: colorScheme.surface,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),

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
        ),

        dropdownMenuEntries: requestTypes.map((type) {
          return DropdownMenuEntry(value: type, label: type);
        }).toList(),

        onSelected: (value) {
          if (value != null) {
            onChanged(value);
          }
        },
      ),
    );
  }
}

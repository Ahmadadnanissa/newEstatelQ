import 'package:flutter/material.dart';
import 'package:estatelqapp/core/app_theme.dart';

class SelectRequestType extends StatefulWidget {
  const SelectRequestType({super.key});

  @override
  State<SelectRequestType> createState() => _SelectRequestTypeState();
}

class _SelectRequestTypeState extends State<SelectRequestType> {
  final List<String> requestTypes = [
    "Complaint",
    "Report Property",
    "General Inquiry",
  ];

  String? selectedRequest;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: width * 0.04,
      ),

      child: DropdownMenu<String>(
        width: width * 0.92,

        hintText: "Select Request Type",

        textStyle: TextStyle(fontSize: width * 0.035),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: primaryColor,

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

        onSelected: (value) {
          setState(() {
            selectedRequest = value;
          });
        },

        dropdownMenuEntries: requestTypes.map((type) {
          return DropdownMenuEntry(value: type, label: type);
        }).toList(),
      ),
    );
  }
}

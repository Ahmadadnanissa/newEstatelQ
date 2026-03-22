import 'package:flutter/material.dart';
import 'package:estatelqapp/core/app_theme.dart';

// ignore: must_be_immutable
class SelectRequestType extends StatefulWidget {
  SelectRequestType({
    super.key,
    required this.requestTypes,
    required this.hintText,
    required this.selectedRequest,
  });
  final List<String> requestTypes;
  final String hintText;
  String selectedRequest;
  @override
  State<SelectRequestType> createState() => _SelectRequestTypeState();
}

class _SelectRequestTypeState extends State<SelectRequestType> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.02),

      child: DropdownMenu<String>(
        hintText: widget.hintText,
        width: width * 0.45,
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
            widget.selectedRequest = value!;
          });
        },

        dropdownMenuEntries: widget.requestTypes.map((type) {
          return DropdownMenuEntry(value: type, label: type);
        }).toList(),
      ),
    );
  }
}

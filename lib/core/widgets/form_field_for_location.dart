import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class FormFieldForLocation extends StatelessWidget {
  final TextEditingController? controller;

  FormFieldForLocation({super.key, this.controller});

  final List<String> locations = [
    'Homs',
    'Hama',
    'Damascus',
    'Aleppo',
    'Latakia',
    'Tartus',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: width * 0.04,
        horizontal: width * 0.04,
      ),
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return const Iterable<String>.empty();
          }

          return locations.where((String option) {
            return option.toLowerCase().contains(
              textEditingValue.text.toLowerCase(),
            );
          });
        },

        fieldViewBuilder:
            (context, autoController, focusNode, onEditingComplete) {
              return SizedBox(
                height: width * 0.11,
                child: TextField(
                  controller: autoController,
                  focusNode: focusNode,

                  onChanged: (value) {
                    controller?.text = value;
                  },
                  decoration: InputDecoration(
                    fillColor: primaryColor,
                    filled: true,
                    prefixIcon: Icon(Icons.search, color: secondaryColor),
                    hintText: "Search Location",
                    hintStyle: TextStyle(fontSize: width * 0.037),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              );
            },
        onSelected: (selection) {
          controller?.text = selection;
        },
      ),
    );
  }
}

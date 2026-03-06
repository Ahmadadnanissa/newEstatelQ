import 'package:flutter/material.dart';
import 'package:estatelqapp/core/app_theme.dart';

class FormFieldForLocation extends StatelessWidget {
  FormFieldForLocation({super.key});

  final List<String> locations = [
    'حمص',
    'حماة',
    'دمشق',
    'حلب',
    'اللاذقية',
    'طرطوس',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: width * 0.04,
        horizontal: width * 0.05,
      ),
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return const Iterable<String>.empty();
          }

          return locations.where((String option) {
            return option.contains(textEditingValue.text);
          });
        },

        fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
          return TextField(
            controller: controller,
            focusNode: focusNode,

            decoration: InputDecoration(
              fillColor: primaryColor,
              filled: true,

              prefixIcon: Icon(Icons.search, color: secondaryColor),

              hintText: "Search Location",

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
        },

        onSelected: (String selection) {},
      ),
    );
  }
}

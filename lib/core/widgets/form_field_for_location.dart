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

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color borderColor = isDark
        ? darkSurfaceColor
        : const Color(0xffE5F0F4);

    final Color hintColor = isDark ? darkSubtitleColor : Colors.grey;

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
                height: width * 0.125,

                child: TextField(
                  controller: autoController,

                  focusNode: focusNode,

                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,

                    fontFamily: fontFamily,
                  ),

                  onChanged: (value) {
                    controller?.text = value;
                  },

                  decoration: InputDecoration(
                    // ================= COLORS =================
                    fillColor: Theme.of(context).cardColor,

                    filled: true,

                    // ================= ICON =================
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: secondaryColor,
                      size: width * 0.06,
                    ),

                    // ================= HINT =================
                    hintText: "Search Location",

                    hintStyle: TextStyle(
                      color: hintColor,

                      fontSize: width * 0.037,

                      fontFamily: fontFamily,
                    ),

                    // ================= BORDERS =================
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),

                      borderSide: BorderSide(color: borderColor, width: 1),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),

                      borderSide: BorderSide(color: secondaryColor, width: 1.2),
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),

                      borderSide: BorderSide(color: borderColor),
                    ),

                    contentPadding: EdgeInsets.symmetric(
                      vertical: width * 0.035,
                    ),
                  ),
                ),
              );
            },

        onSelected: (selection) {
          controller?.text = selection;
        },

        optionsViewBuilder: (context, onSelected, options) {
          return Align(
            alignment: Alignment.topLeft,

            child: Material(
              color: Theme.of(context).cardColor,

              borderRadius: BorderRadius.circular(16),

              elevation: 4,

              child: Container(
                width: width * 0.85,

                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,

                  borderRadius: BorderRadius.circular(16),
                ),

                child: ListView.builder(
                  padding: EdgeInsets.zero,

                  shrinkWrap: true,

                  itemCount: options.length,

                  itemBuilder: (context, index) {
                    final option = options.elementAt(index);

                    return ListTile(
                      leading: Icon(
                        Icons.location_on_rounded,
                        color: secondaryColor,
                      ),

                      title: Text(
                        option,

                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,

                          fontFamily: fontFamily,
                        ),
                      ),

                      onTap: () {
                        onSelected(option);
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

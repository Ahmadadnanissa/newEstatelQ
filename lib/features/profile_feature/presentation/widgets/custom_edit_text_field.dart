import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class CustomEditTextField extends StatelessWidget {
  const CustomEditTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.icon,
  });

  final TextEditingController controller;
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: width * 0.17,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(
          width: 0.5,
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(width * 0.01),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFont(
                    name: title,
                    fontColor: Theme.of(context).colorScheme.onSurface,
                    fontSize: width * 0.037,
                  ),

                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: width * 0.033,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}

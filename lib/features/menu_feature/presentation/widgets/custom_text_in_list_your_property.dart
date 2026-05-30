import 'package:flutter/material.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';

class CustomTextInListYourProperty extends StatelessWidget {
  const CustomTextInListYourProperty({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return CustomFont(
      name: name,
      fontColor: Theme.of(context).colorScheme.onSurface,
      fontSize: width * 0.043,
      fontWeight: FontWeight.w600,
    );
  }
}

import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class CustomSubTitleForFilterPage extends StatelessWidget {
  const CustomSubTitleForFilterPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: width * 0.02,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: CustomFont(
          name: title,
          fontColor: Theme.of(context).colorScheme.onSurface,
          fontSize: width * 0.05,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

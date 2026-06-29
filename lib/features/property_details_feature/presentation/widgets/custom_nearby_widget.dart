import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class CustomNearbyWidget extends StatelessWidget {
  const CustomNearbyWidget({super.key, required this.name});
  final String name;
  String formatOutdoorType(String type) {
    return type
        .toLowerCase()
        .split('_')
        .map(
          (word) =>
              word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '',
        )
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color bgColor = isDark
        ? const Color(0xff1C1C1E)
        : const Color(0xffF7F8FA);

    final Color borderColor = greenColor.withOpacity(0.25);

    final Color textColor =
        Theme.of(context).textTheme.bodyMedium?.color ?? blackColor;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(width * 0.025),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.2 : 0.08),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: width * 0.015,
        ),
        child: CustomFont(
          name: formatOutdoorType(name),
          fontColor: textColor.withOpacity(0.8),
          fontSize: width * 0.035,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

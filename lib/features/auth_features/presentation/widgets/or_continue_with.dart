import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class OrContinueWith extends StatelessWidget {
  const OrContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: width * 0.1,
        horizontal: width * 0.03,
      ),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: isDark ? darkSubtitleColor : Colors.grey.shade400,
            ),
          ),

          CustomFont(
            name: ' Or Continue With ',

            // نص ثانوي
            fontColor: isDark ? darkSubtitleColor : greenColor,

            fontSize: width * 0.035,

            fontWeight: FontWeight.w500,
          ),

          Expanded(
            child: Divider(
              thickness: 1,
              color: isDark ? darkSubtitleColor : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}

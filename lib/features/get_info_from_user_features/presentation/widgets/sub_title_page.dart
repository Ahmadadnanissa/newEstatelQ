import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SubTitlePage extends StatelessWidget {
  SubTitlePage({super.key, required this.subTitle});

  String subTitle;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      child: CustomFont(
        name: subTitle,

        // لون متناسق مع الثيمين
        fontColor: isDark ? darkSubtitleColor : greenColor,

        fontSize: width * 0.048,
      ),
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.title});
  String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return AppBar(
      backgroundColor: primaryColor,
      title: Text(
        title,
        style: TextStyle(color: secondaryColor, fontSize: width * 0.04),
      ),
      centerTitle: true,
      leading: Icon(
        Icons.arrow_back,
        color: secondaryColor,
        size: width * 0.07,
      ),
    );
  }
}

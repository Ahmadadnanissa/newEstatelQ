import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBarHomePage extends StatelessWidget implements PreferredSizeWidget {
  AppBarHomePage({super.key, required this.title, required this.onTap});
  String title;
  void Function() onTap;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return AppBar(
      elevation: 0.5,
      shadowColor: primaryColor,
      backgroundColor: primaryColor,
      title: Text(
        title,
        style: TextStyle(
          color: secondaryColor,
          fontSize: width * 0.05,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: onTap,
        child: Icon(Icons.menu, color: secondaryColor, size: width * 0.08),
      ),
    );
  }
}

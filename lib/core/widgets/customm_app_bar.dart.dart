import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustommAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustommAppBar({
    super.key,
    required this.title,
    required this.sizeTitle,
    this.iconLeading,
    this.onTapleading,
    this.iconAction,
    this.onTapAction,
  });
  final String title;
  final double sizeTitle;
  void Function()? onTapleading;
  final Widget? iconLeading;
  void Function()? onTapAction;
  final Widget? iconAction;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      shadowColor: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(
        title,
        style: TextStyle(
          color: secondaryColor,
          fontSize: sizeTitle,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: iconLeading != null
          ? GestureDetector(onTap: onTapleading, child: iconLeading)
          : null,
      actions: iconAction != null
          ? [GestureDetector(onTap: onTapAction, child: iconAction)]
          : [],
    );
  }
}

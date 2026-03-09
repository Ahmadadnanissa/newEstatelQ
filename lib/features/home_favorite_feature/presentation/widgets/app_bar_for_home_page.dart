import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/customm_app_bar.dart.dart';
import 'package:flutter/material.dart';

class AppBarForHomePage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarForHomePage({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CustommAppBar(
      title: 'EstatelQ',
      sizeTitle: width * 0.06,
      iconLeading: Icon(Icons.menu, color: secondaryColor, size: width * 0.08),
    );
  }
}

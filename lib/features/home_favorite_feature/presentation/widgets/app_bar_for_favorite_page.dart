import 'package:estatelqapp/core/widgets/customm_app_bar.dart.dart';
import 'package:flutter/material.dart';

class AppBarForFavoritePage extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarForFavoritePage({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CustommAppBar(title: 'My Favorite', sizeTitle: width * 0.06);
  }
}

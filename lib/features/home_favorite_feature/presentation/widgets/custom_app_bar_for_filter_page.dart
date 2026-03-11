import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/customm_app_bar.dart.dart';
import 'package:flutter/material.dart';

class CustomAppBarForFilterPage extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarForFilterPage({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CustommAppBar(
      title: 'Filters',
      sizeTitle: width * 0.05,
      iconLeading: Icon(
        Icons.arrow_back,
        color: secondaryColor,
        size: width * 0.08,
      ),
      onTapleading: () {
        Navigator.pop(context);
      },
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/customm_app_bar.dart.dart';
import 'package:flutter/material.dart';

class CustomAppBarForProfile extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarForProfile({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CustommAppBar(
      title: title,
      sizeTitle: width * 0.06,
      iconLeading: Icon(
        Icons.arrow_back,
        color: secondaryColor,
        size: width * 0.07,
      ),
      onTapleading: () {
        Navigator.pop(context);
      },
    );
  }
}

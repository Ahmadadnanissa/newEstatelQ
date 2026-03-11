import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/body_filter_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/custom_app_bar_for_filter_page.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});
  static String id = 'FilterPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: CustomAppBarForFilterPage(),
      body: BodyFilterPage(),
    );
  }
}

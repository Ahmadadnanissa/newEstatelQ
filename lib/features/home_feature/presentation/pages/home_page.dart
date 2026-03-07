import 'package:estatelqapp/features/home_feature/presentation/widgets/app_bar_home_page.dart';
import 'package:estatelqapp/features/home_feature/presentation/widgets/body_home_page.dart';
import 'package:estatelqapp/features/home_feature/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHomePage(title: 'EstatelQ', onTap: () {}),
      body: BodyHomePage(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

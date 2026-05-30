import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/app_bar_for_home_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/body_home_page.dart';
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBarForHomePage(),
      body: BodyHomePage(),
    );
  }
}

import 'package:estatelqapp/features/profile_feature/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'favorite_page.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentIndex = 0;

  final List<Widget> pages = [HomePage(), FavoritePage(), ProfilePage()];

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),

      floatingActionButton: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: changePage,
      ),
    );
  }
}

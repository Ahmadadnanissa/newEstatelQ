import 'package:estatelqapp/features/menu_feature/presentation/widgets/body_menu_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});
  static String id = 'MenuPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xffEDF6F9), body: BodyMenuPage());
  }
}

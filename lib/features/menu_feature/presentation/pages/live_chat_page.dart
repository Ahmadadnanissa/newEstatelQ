import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/customm_app_bar.dart.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/body_live_chat_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/bottom_navigation_bar_for_live_chat_page.dart';
import 'package:flutter/material.dart';

class LiveChatPage extends StatelessWidget {
  const LiveChatPage({super.key, required this.dealId});
  final String dealId;
  static String id = 'LiveChatPage';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: CustommAppBar(
          title: 'Live Chat',
          sizeTitle: width * 0.06,
          iconLeading: Icon(
            Icons.chevron_left,
            color: secondaryColor,
            size: width * 0.1,
          ),
          onTapleading: () {
            Navigator.pop(context);
          },
        ),
        body: BodyLiveChatPage(dealId: dealId),
        bottomNavigationBar: BottomNavigationBarForLiveChatPage(),
      ),
    );
  }
}

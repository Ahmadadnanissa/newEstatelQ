import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/app_bar_menu_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/check_page_to_navigate.dart';
import 'package:flutter/material.dart';

class BodyMenuPage extends StatelessWidget {
  const BodyMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarMenuPage(
            image: 'assets/images/ali-morshedlou-WMD64tMfc4k-unsplash.jpg',
            name: 'Ahmad Issa',
            email: 'Ahmad123@gmail.com',
          ),
          Divider(thickness: 0.2, endIndent: 0, color: blackColor, indent: 0),

          CheckPageToNavigate(),

          SizedBox(height: width * 0.02),
          Padding(
            padding: EdgeInsets.only(left: width * 0.24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.assistant,
                      size: width * 0.06,
                      color: Color(0xff5F6264),
                    ),
                    SizedBox(width: width * 0.04),
                    CustomFont(
                      name: 'AI Assistant',
                      fontColor: blackColor,
                      fontSize: width * 0.04,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

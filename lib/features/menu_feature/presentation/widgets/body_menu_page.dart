import 'package:flutter/material.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/app_bar_menu_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/body_ai_assistant.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/check_page_to_navigate.dart';

class BodyMenuPage extends StatelessWidget {
  const BodyMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarMenuPage(
            image: 'assets/images/ali-morshedlou-WMD64tMfc4k-unsplash.jpg',
            name: 'Ahmad Issa',
            email: 'Ahmad123@gmail.com',
          ),

          Divider(
            thickness: 0.2,
            color: colorScheme.onSurface.withValues(alpha: 0.2),
          ),

          const CheckPageToNavigate(),

          SizedBox(height: width * 0.04),

          /// 🌟 AI Section (NOW PREMIUM CARD)
          Padding(
            padding: EdgeInsets.only(
              top: width * 0.05,
              left: width * 0.24,
              bottom: width * 0.05,
            ),
            child: Container(
              padding: EdgeInsets.all(width * 0.04),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.auto_awesome_rounded,
                        color: colorScheme.primary,
                        size: width * 0.07,
                      ),
                      SizedBox(width: width * 0.03),
                      CustomFont(
                        name: 'AI Assistant',
                        fontColor: colorScheme.onSurface,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),

                  SizedBox(height: width * 0.02),

                  CustomFont(
                    name: 'Ask anything about properties',
                    fontColor: colorScheme.onSurface.withValues(alpha: 0.6),
                    fontSize: width * 0.035,
                  ),

                  SizedBox(height: width * 0.02),

                  const BodyAiAssistant(),
                ],
              ),
            ),
          ),

          SizedBox(height: width * 0.05),
        ],
      ),
    );
  }
}

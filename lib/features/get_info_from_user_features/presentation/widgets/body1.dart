import 'package:estatelqapp/core/widgets/skip_button.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user2.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/onboardingIllustraion.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/sub_title_page.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/title_page.dart';

import 'package:flutter/material.dart';

class Body1 extends StatefulWidget {
  const Body1({super.key});

  @override
  State<Body1> createState() => _Body1State();
}

class _Body1State extends State<Body1> {
  String isSelected = 'buy';

  // لمنع تنفيذ أكثر من Swipe أثناء الانتقال
  bool _isNavigating = false;

  Future<void> _goToNextPage() async {
    if (_isNavigating) return;

    setState(() {
      _isNavigating = true;
    });

    await Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 350),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) {
          return GetinfoFromUser2(selectedType: isSelected);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: Curves.easeOutCubic));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );

    if (mounted) {
      setState(() {
        _isNavigating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,

        onHorizontalDragEnd: (details) {
          final velocity = details.primaryVelocity ?? 0;

          // Swipe من اليمين لليسار
          if (velocity < -300) {
            _goToNextPage();
          }

          // Body1 هي أول صفحة، لذلك لا يوجد رجوع للخلف.
        },

        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: width * 0.2),

                    OnboardingIllustration(
                      imagePath: 'assets/images/House searching-amico.png',
                    ),

                    TitlePage(title: 'Find Your Perfect Property'),

                    SubTitlePage(
                      subTitle:
                          'Explore properties for sale or rent, all in one place.Find what fits you, faster and easier.',
                    ),

                    // مساحة إضافية حتى لا يتداخل المحتوى مع Skip
                    SizedBox(height: width * 0.30),
                  ],
                ),
              ),
            ),

            // Skip Button
            const SkipButton(),
          ],
        ),
      ),
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/skip_button.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user4.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/onboardingIllustraion.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/sub_title_page.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/title_page.dart';
import 'package:flutter/material.dart';

class Body3 extends StatefulWidget {
  const Body3({super.key, this.selectedType, this.selectedLocation});

  final String? selectedType;
  final String? selectedLocation;

  @override
  State<Body3> createState() => _Body3State();
}

class _Body3State extends State<Body3> {
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();

  bool _isNavigating = false;

  @override
  void dispose() {
    maxPriceController.dispose();
    minPriceController.dispose();
    super.dispose();
  }

  Future<void> _goToNextPage() async {
    if (_isNavigating) return;

    setState(() {
      _isNavigating = true;
    });

    final String min = minPriceController.text;
    final String max = maxPriceController.text;

    await Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 350),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) {
          return GetinfoFromUser4(
            minPrice: min,
            maxPrice: max,
            selectedLocation: widget.selectedLocation,
            selectedType: widget.selectedType,
          );
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

  void _goToPreviousPage() {
    if (_isNavigating) return;

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,

        onHorizontalDragEnd: (details) {
          final velocity = details.primaryVelocity ?? 0;

          // Swipe Left → الصفحة التالية
          if (velocity < -300) {
            _goToNextPage();
          }
          // Swipe Right → الصفحة السابقة
          else if (velocity > 300) {
            _goToPreviousPage();
          }
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
                      imagePath: 'assets/images/Connected world-bro.png',
                    ),

                    SizedBox(height: width * 0.035),

                    // Onboarding Page Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        final bool isActive = index == 2;

                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOut,
                          margin: EdgeInsets.symmetric(
                            horizontal: width * 0.012,
                          ),
                          width: isActive ? width * 0.055 : width * 0.022,
                          height: width * 0.022,
                          decoration: BoxDecoration(
                            color: isActive
                                ? secondaryColor
                                : (isDark
                                      ? darkContainerColor
                                      : greenColor.withOpacity(0.35)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                      }),
                    ),

                    SizedBox(height: width * 0.035),

                    TitlePage(title: 'Everything in One Conversation'),

                    SubTitlePage(
                      subTitle:
                          'Chat with our team and keep everything in one place.Simple, clear, and always within reach.',
                    ),

                    // مساحة حتى لا يتداخل المحتوى مع Skip
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

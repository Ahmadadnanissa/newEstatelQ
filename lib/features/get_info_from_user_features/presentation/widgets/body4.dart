import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/core/widgets/skip_button.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/welcome_page.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/onboardingIllustraion.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/sub_title_page.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/title_page.dart';
import 'package:flutter/material.dart';

class Body4 extends StatefulWidget {
  const Body4({
    super.key,
    this.selectedType,
    this.selectedLocation,
    this.minPrice,
    this.maxPrice,
  });

  final String? selectedType;
  final String? selectedLocation;
  final String? minPrice;
  final String? maxPrice;

  @override
  State<Body4> createState() => _Body4State();
}

class _Body4State extends State<Body4> {
  TextEditingController roomController = TextEditingController();

  bool _isNavigating = false;

  @override
  void dispose() {
    roomController.dispose();
    super.dispose();
  }

  Future<void> _finishOnboarding() async {
    if (_isNavigating) return;

    setState(() {
      _isNavigating = true;
    });

    final String numberOfRoom = roomController.text;

    print(numberOfRoom);
    print(widget.selectedLocation);
    print(widget.selectedType);
    print(widget.minPrice);
    print(widget.maxPrice);

    await Navigator.pushAndRemoveUntil(
      context,
      SlideRight(page: const WelcomePage()),
      (route) => false,
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

    return SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,

        onHorizontalDragEnd: (details) {
          final velocity = details.primaryVelocity ?? 0;

          // Swipe Left → إنهاء الـ Onboarding
          if (velocity < -300) {
            _finishOnboarding();
          }
          // Swipe Right → الرجوع إلى Body3
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
                      imagePath: 'assets/images/New notifications-amico.png',
                    ),

                    TitlePage(title: 'Stay Updated, Every Step'),

                    SubTitlePage(
                      subTitle:
                          'Follow your property status in real time.Get notified whenever something changes.',
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

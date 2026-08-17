import 'package:estatelqapp/core/widgets/skip_button.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user3.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/onboardingIllustraion.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/sub_title_page.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/title_page.dart';
import 'package:flutter/material.dart';

class Body2 extends StatefulWidget {
  const Body2({super.key, this.selectedType});

  final String? selectedType;

  @override
  State<Body2> createState() => _Body2State();
}

class _Body2State extends State<Body2> {
  TextEditingController locationController = TextEditingController();

  String? selectedLocation;

  bool _isNavigating = false;

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }

  Future<void> _goToNextPage() async {
    if (_isNavigating) return;

    setState(() {
      _isNavigating = true;
    });

    final String location = locationController.text;

    await Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 350),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) {
          return GetinfoFromUser3(
            selectedLocation: location,
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
                      imagePath: 'assets/images/Active Support-bro.png',
                    ),

                    TitlePage(title: 'We’re Here When You Need Us'),

                    SubTitlePage(
                      subTitle:
                          'Get quick help whenever you need it.Our team is always just a message away.',
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

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatefulWidget {
  const SkipButton({super.key});

  @override
  State<SkipButton> createState() => _SkipButtonState();
}

class _SkipButtonState extends State<SkipButton> {
  double _scale = 1.0;
  double _opacity = 1.0;
  bool _isNavigating = false;

  Future<void> _onTap() async {
    if (_isNavigating) return;

    setState(() {
      _isNavigating = true;
      _scale = 0.94;
      _opacity = 0.75;
    });

    await Future.delayed(const Duration(milliseconds: 100));

    if (!mounted) return;

    setState(() {
      _scale = 1.0;
      _opacity = 1.0;
    });

    await Navigator.pushAndRemoveUntil(
      context,
      SlideRight(page: const WelcomePage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.only(right: width * 0.05, bottom: width * 0.04),
        child: GestureDetector(
          onTap: _onTap,

          onTapDown: (_) {
            if (_isNavigating) return;

            setState(() {
              _scale = 0.94;
              _opacity = 0.75;
            });
          },

          onTapUp: (_) {
            if (_isNavigating) return;

            setState(() {
              _scale = 1.0;
              _opacity = 1.0;
            });
          },

          onTapCancel: () {
            if (_isNavigating) return;

            setState(() {
              _scale = 1.0;
              _opacity = 1.0;
            });
          },

          child: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(milliseconds: 150),

            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(milliseconds: 150),

              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.045,
                  vertical: width * 0.022,
                ),

                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(width * 0.06),
                  border: Border.all(
                    color: secondaryColor.withValues(alpha: 0.7),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: isDark ? 0.12 : 0.07,
                      ),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Skip',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontFamily: fontFamily,
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(width: width * 0.012),

                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: width * 0.032,
                      color: secondaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/core/services/visitor_local_storage_services.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/first_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/navigation_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static String id = 'SplashScreen';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    _handleNavigation();
  }

  Future<void> _handleNavigation() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Client ID
    final String? clientId = LocalStorageService.getId();

    // Visitor ID
    final String? visitorId = VisitorLocalStorageService.getVisitorId();

    if (clientId != null && clientId.isNotEmpty) {
      // المستخدم Client ومسجل من قبل
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavigationPage()),
      );
    } else if (visitorId != null && visitorId.isNotEmpty) {
      // المستخدم Visitor وعنده Visitor ID
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavigationPage()),
      );
    } else {
      // مستخدم جديد بالكامل
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FirstPage()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDF6F9),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Image.asset(
              'assets/images/Gemini_Generated_Image_r6bcsir6bcsir6bc.png',
              width: 160,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/body_profile_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static String id = 'ProfilePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: primaryColor, body: BodyProfilePage());
  }
}

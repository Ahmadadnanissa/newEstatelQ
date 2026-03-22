import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/body_edit_profile_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/custom_app_bar_for_profile.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});
  static String id = 'EditProfilePage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: CustomAppBarForProfile(title: 'Edite Profile'),
        body: BodyEditProfilePage(),
      ),
    );
  }
}

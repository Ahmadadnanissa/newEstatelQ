import 'package:estatelqapp/features/profile_feature/presentation/widgets/body_edit_profile_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/custom_app_bar_for_profile.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.location,
  });
  static String id = 'EditProfilePage';
  final String name;
  final String email;
  final String phone;
  final String image;
  final String location;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: CustomAppBarForProfile(title: 'Edite Profile'),
        body: BodyEditProfilePage(
          name: name,
          email: email,
          phone: phone,
          location: location,
          image: image,
        ),
      ),
    );
  }
}

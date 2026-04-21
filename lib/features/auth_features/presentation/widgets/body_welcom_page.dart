import 'package:estatelqapp/features/auth_features/presentation/widgets/get_start_button.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/go_to_login_button.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/subtitle_text.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/title_text.dart';
import 'package:estatelqapp/features/auth_features/presentation/widgets/welcome_image.dart';
import 'package:flutter/material.dart';

class BodyWelcomPage extends StatefulWidget {
  const BodyWelcomPage({super.key});

  @override
  State<BodyWelcomPage> createState() => _BodyWelcomPageState();
}

class _BodyWelcomPageState extends State<BodyWelcomPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            WelcomeImage(),
            TitleText(),
            SubtitleText(),
            GetStartButton(),
            GoToLoginButton(),
          ],
        ),
      ),
    );
  }
}

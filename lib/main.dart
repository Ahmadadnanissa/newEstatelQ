import 'package:estatelqapp/features/auth_features/presentation/pages/login_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/signup_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/welcome_page.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/pages/change_password_page.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/pages/enter_your_email.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/pages/otp_verifivcation_page_for_password.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user1.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user2.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user3.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        GetinfoFromUser1.id: (context) => GetinfoFromUser1(),
        GetinfoFromUser2.id: (context) => GetinfoFromUser2(),
        GetinfoFromUser3.id: (context) => GetinfoFromUser3(),
        GetinfoFromUser4.id: (context) => GetinfoFromUser4(),
        ChangePasswordPage.id: (context) => ChangePasswordPage(),
        EnterYourEmail.id: (context) => EnterYourEmail(),
        OtpVerifivcationPageForPassword.id: (context) =>
            OtpVerifivcationPageForPassword(),
      },
      initialRoute: WelcomePage.id,
      // debugShowCheckedModeBanner: false,
    );
  }
}

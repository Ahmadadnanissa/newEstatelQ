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
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/favorite_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/filter_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/home_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/list_your_property_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/live_chat_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/menu_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/notification_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/edit_profile_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/help_and_support_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/profile_page.dart';
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
        FavoritePage.id: (context) => FavoritePage(),
        ProfilePage.id: (context) => ProfilePage(),
        HelpAndSupportPage.id: (context) => HelpAndSupportPage(),
        EditProfilePage.id: (context) => EditProfilePage(),
        FilterPage.id: (context) => FilterPage(),
        LiveChatPage.id: (context) => LiveChatPage(),
        NotificationPage.id: (context) => NotificationPage(),
        ListYourPropertyPage.id: (context) => ListYourPropertyPage(),
        MenuPage.id: (context) => MenuPage(),
        HomePage.id: (context) => HomePage(),
        OtpVerifivcationPageForPassword.id: (context) =>
            OtpVerifivcationPageForPassword(),
      },
      initialRoute: WelcomePage.id,
      debugShowCheckedModeBanner: false,
    );
  }
}

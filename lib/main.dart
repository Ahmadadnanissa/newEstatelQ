import 'package:estatelqapp/core/services/socket_service.dart';
import 'package:estatelqapp/features/auth_features/data/datasources/auth_remote_data_source.dart';
import 'package:estatelqapp/features/auth_features/domain/repository/auth_repository_impl.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/google_login_with_use_case.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/login_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/signup_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/welcome_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/state_management/auth_provider.dart';
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
import 'package:estatelqapp/features/home_favorite_feature/presentation/provider/home_provider.dart';
import 'package:estatelqapp/features/menu_feature/data/datasources/notification_remote.dart';
import 'package:estatelqapp/features/menu_feature/data/datasources/property_status_remote_data_source.dart';
import 'package:estatelqapp/features/menu_feature/data/repositories/notification_impl.dart';
import 'package:estatelqapp/features/menu_feature/data/repositories/property_status_reomte_data_source_impl.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/list_your_property_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/live_chat_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/map_page_for_request_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/menu_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/notification_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/chat_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/notification_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/property_status_provider.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/edit_profile_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/enter_your_adress_with_map_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/help_and_support_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/profile_page.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/pages/property_page.dart';
import 'package:estatelqapp/firebase_options.dart';
import 'package:estatelqapp/splash__page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() async {
  final remoteA = AuthRemoteDataSource(http.Client());

final repoA = AuthRepositoryImpl(remoteA);

final useCaseA = GoogleLoginUseCase(repoA);
  final remote = NotificationRemoteDataSource(http.Client());
  final repo = NotificationRepositoryImpl(remote);
  final statusRemote = PropertyStatusRemoteDataSource();
  final statusRepo = PropertyStatusRepositoryImpl(statusRemote);
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),

ChangeNotifierProvider(
  create: (_) => AuthProvider(useCaseA),
),

        ChangeNotifierProvider(create: (_) => NotificationProvider(repo)),

        ChangeNotifierProvider(create: (_) => ChatProvider(SocketService())),

        ChangeNotifierProvider(
          create: (_) => PropertyStatusProvider(statusRepo),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        SplashPage.id: (context) => SplashPage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        GetinfoFromUser1.id: (context) => GetinfoFromUser1(),
        GetinfoFromUser2.id: (context) => GetinfoFromUser2(),
        GetinfoFromUser3.id: (context) => GetinfoFromUser3(),
        GetinfoFromUser4.id: (context) => GetinfoFromUser4(),
        ChangePasswordPage.id: (context) => ChangePasswordPage(),
        EnterYourEmail.id: (context) => EnterYourEmail(),
        FavoritePage.id: (context) => FavoritePage(),
        PropertyPage.id: (context) => PropertyPage(),
        ProfilePage.id: (context) => ProfilePage(),
        HelpAndSupportPage.id: (context) => HelpAndSupportPage(),
        EditProfilePage.id: (context) => EditProfilePage(),
        FilterPage.id: (context) => FilterPage(),
        LiveChatPage.id: (context) => LiveChatPage(),
        NotificationPage.id: (context) => NotificationPage(),
        ListYourPropertyPage.id: (context) => ListYourPropertyPage(),
        MenuPage.id: (context) => MenuPage(),
        MapPageForRequestPage.id: (context) => MapPageForRequestPage(),
        EnterYourAdressWithMapPage.id: (context) =>
            EnterYourAdressWithMapPage(),
        HomePage.id: (context) => HomePage(),
        OtpVerifivcationPageForPassword.id: (context) =>
            OtpVerifivcationPageForPassword(),
      },
      initialRoute: SplashPage.id,
      debugShowCheckedModeBanner: false,
    );
  }
}

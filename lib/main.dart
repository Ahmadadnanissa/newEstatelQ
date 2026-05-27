import 'package:estatelqapp/core/services/socket_service.dart';
import 'package:estatelqapp/core/widgets/notification_overlay.dart';
import 'package:estatelqapp/features/auth_features/data/datasources/auth_remote_data_source.dart';
import 'package:estatelqapp/features/auth_features/domain/repository/auth_repository_impl.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/google_login_with_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/log_out_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/login_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/send_otp_use_Case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/sign_up_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/verify_otp_use_case.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/login_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/signup_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/welcome_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/state_management/auth_provider.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/pages/change_password_page.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/pages/enter_your_email.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user1.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user2.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user3.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user4.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/datasources/favorite_remote_data_source.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/datasources/property_card_data_source.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/repositories/favorite_repository.dart';
import 'package:estatelqapp/features/home_favorite_feature/data/repositories/property_card_repository_impl.dart';
import 'package:estatelqapp/features/home_favorite_feature/domain/usecases/add_to_favorite_use_case.dart';
import 'package:estatelqapp/features/home_favorite_feature/domain/usecases/get_fovorite_properties_use_case.dart';
import 'package:estatelqapp/features/home_favorite_feature/domain/usecases/get_property_cards_use_case.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/favorite_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/filter_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/home_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/provider/favorite_provider.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/provider/home_provider.dart';
import 'package:estatelqapp/features/menu_feature/data/datasources/notification_remote.dart';
import 'package:estatelqapp/features/menu_feature/data/datasources/property_status_remote_data_source.dart';
import 'package:estatelqapp/features/menu_feature/data/datasources/request_remote_data_source.dart';
import 'package:estatelqapp/features/menu_feature/data/repositories/property_status_reomte_data_source_impl.dart';
import 'package:estatelqapp/features/menu_feature/data/repositories/request_repository.dart';
import 'package:estatelqapp/features/menu_feature/domain/repository/notification.dart';
import 'package:estatelqapp/features/menu_feature/domain/repository/property_status_repository.dart';
import 'package:estatelqapp/features/menu_feature/domain/usecases/get_property_activities.dart';
import 'package:estatelqapp/features/menu_feature/domain/usecases/mark_as_read_usecase.dart';
import 'package:estatelqapp/features/menu_feature/domain/usecases/send_request_use_case.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/list_your_property_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/live_chat_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/map_page_for_request_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/menu_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/notification_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/chat_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/notification_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/property_status_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/request_provider.dart';
import 'package:estatelqapp/features/profile_feature/data/datasources/client_remote_data_source.dart';
import 'package:estatelqapp/features/profile_feature/data/datasources/support_remote_data_source.dart';
import 'package:estatelqapp/features/profile_feature/data/repositories/client_repository.dart';
import 'package:estatelqapp/features/profile_feature/data/repositories/support_repository.dart';
import 'package:estatelqapp/features/profile_feature/domain/usecases/get_client_use_case.dart';
import 'package:estatelqapp/features/profile_feature/domain/usecases/submit_complaint_use_case.dart';
import 'package:estatelqapp/features/profile_feature/domain/usecases/update_address_use_case.dart';
import 'package:estatelqapp/features/profile_feature/domain/usecases/update_profile_use_case.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/edit_profile_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/enter_your_adress_with_map_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/help_and_support_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/profile_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/providers/client_provider.dart';
import 'package:estatelqapp/features/profile_feature/presentation/providers/support_provider.dart';
import 'package:estatelqapp/features/property_details_feature/data/datasources/property_details_remote_data_source.dart';
import 'package:estatelqapp/features/property_details_feature/data/repositories/property_details_repository_impl.dart';
import 'package:estatelqapp/features/property_details_feature/domain/usecases/get_property_by_id_use_case.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/pages/property_page.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/providers/property_details_provider.dart';
import 'package:estatelqapp/firebase_options.dart';
import 'package:estatelqapp/splash__page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('authBox');
  final remoteP = PropertyCardRemoteDataSource(
    // http.Client()
  );
  final remotepd = PropertyDetailsRemoteDataSource(
    // http.Client()
  );
  final repoPd = PropertyDetailsRepositoryImpl(remotepd);
  final getPropertByIdUseCase = GetPropertyByIdUseCase(repoPd);
  final repoP = PropertyCardRepositoryImpl(remoteP);
  final useCaseP = GetPropertiesCardUseCase(repoP);
  final remoteA = AuthRemoteDataSource(http.Client());
  final repoA = AuthRepositoryImpl(remoteA);
  // final useCaseA = LoginWithGoogleUseCase(repoA);
  final loginUseCase = LoginUseCase(repoA);
  final logoutUseCase = LogoutUseCase(repoA);
  final signUpUseCase = SignupUseCase(repoA);
  final verifyOtpUseCase = VerifyOtpUseCase(repoA);
  final sendOtpUseCase = SendOtpUseCase(repoA);
  final remote = NotificationRemoteDataSource(http.Client());
  final repo = NotificationRepository(remote);
  final statusRemote = PropertyStatusRemoteDataSource(http.Client());
  final statusRepo = PropertyStatusRepositoryImpl(statusRemote);
  final getPropertyActivities = GetPropertyActivities(statusRepo);
  // Favorite

  final favoriteRemote = FavoriteRemoteDataSource(
    // http.Client()
  );

  final requestRemote = RequestRemoteDataSource(http.Client());

  final requestRepo = RequestRepository(requestRemote);

  final sendRequestUseCase = SendRequestUseCase(requestRepo);

  final favoriteRepo = FavoriteRepository(favoriteRemote);

  final getFavoriteUseCase = GetFavoritePropertiesUseCase(favoriteRepo);

  final addFavoriteUseCase = AddToFavoriteUseCase(favoriteRepo);

  final clientRemote = ClientRemoteDataSource(http.Client());
  final clientRepo = ClientRepository(clientRemote);
  final getClientUseCase = GetClientUseCase(clientRepo);
  final updateUdressUseCase = UpdateAddressUseCase(clientRepo);
  final updateProfileUseCase = UpdateProfileUseCase(clientRepo);
  WidgetsFlutterBinding.ensureInitialized();
  final supportRemote = SupportRemoteDataSource(http.Client());
  final supportRepo = SupportRepository(supportRemote);

  final submitComplaintUseCase = SubmitComplaintUseCase(supportRepo);
  final socketService = SocketService();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RequestProvider(sendRequestUseCase),
        ),
        // ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(useCaseP)..getProperties(),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              FavoriteProvider(getFavoriteUseCase, addFavoriteUseCase)
                ..getFavorites(),
        ),
        ChangeNotifierProvider(
          create: (_) => ClientProvider(
            getClientUseCase,
            updateUdressUseCase,
            updateProfileUseCase,
          ),
        ),

        ChangeNotifierProvider(
          create: (_) => SupportProvider(submitComplaintUseCase),
        ),

        ChangeNotifierProvider(
          create: (_) => AuthProvider(
            loginUseCase,
            signUpUseCase,
            verifyOtpUseCase,
            sendOtpUseCase,
            logoutUseCase,
          ),
        ),

        ChangeNotifierProvider(
          create: (_) => PropertyDetailsProvider(getPropertByIdUseCase),
        ),

        ChangeNotifierProvider(
          create: (_) => NotificationProvider(
            repo,
            socketService,
            MarkAsReadUseCase(repo),
          ),
        ),

        ChangeNotifierProvider(create: (_) => ChatProvider(SocketService())),

        ChangeNotifierProvider(
          create: (_) => PropertyStatusProvider(getPropertyActivities),
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
      scaffoldMessengerKey: NotificationOverlay.key,
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
        PropertyPage.id: (context) => PropertyPage(propertyId: ""),
        ProfilePage.id: (context) => ProfilePage(),
        HelpAndSupportPage.id: (context) => HelpAndSupportPage(),
        EditProfilePage.id: (context) => EditProfilePage(
          name: '',
          email: '',
          phone: '',
          image: '',
          location: '',
        ),
        FilterPage.id: (context) => FilterPage(),
        LiveChatPage.id: (context) => LiveChatPage(),
        NotificationPage.id: (context) => NotificationPage(),
        ListYourPropertyPage.id: (context) => ListYourPropertyPage(),
        MenuPage.id: (context) => MenuPage(),
        MapPageForRequestPage.id: (context) => MapPageForRequestPage(),
        EnterYourAdressWithMapPage.id: (context) =>
            EnterYourAdressWithMapPage(),
        HomePage.id: (context) => HomePage(),
        // OtpVerifivcationPageForPassword.id: (context) =>
        //     OtpVerifivcationPageForPassword(email: ''),
      },
      initialRoute: SplashPage.id,
      debugShowCheckedModeBanner: false,
    );
  }
}

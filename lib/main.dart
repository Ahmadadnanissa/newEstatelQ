import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/services/app_navigation.dart';

import 'package:estatelqapp/core/services/socket_service.dart';
import 'package:estatelqapp/core/them_provider.dart';
import 'package:estatelqapp/features/auth_features/data/datasources/auth_remote_data_source.dart';
import 'package:estatelqapp/features/auth_features/domain/repository/auth_repository_impl.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/forgot_password_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/log_out_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/login_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/reset_password_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/send_otp_use_Case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/sign_up_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/verify_forgot_password_otp_use_case.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/verify_otp_use_case.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/login_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/signup_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/pages/welcome_page.dart';
import 'package:estatelqapp/features/auth_features/presentation/state_management/auth_provider.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/pages/change_password_page.dart';
import 'package:estatelqapp/features/forget_password_features/presentation/pages/enter_your_email.dart';
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
import 'package:estatelqapp/features/menu_feature/domain/usecases/get_property_activities.dart';
import 'package:estatelqapp/features/menu_feature/domain/usecases/mark_as_read_use_case.dart';
import 'package:estatelqapp/features/menu_feature/domain/usecases/send_request_use_case.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/list_your_property_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/live_chat_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/map_page_for_request_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/menu_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/notification_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/rooms_live_chat_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/chat_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/chat_with_ai_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/notification_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/property_status_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/request_provider.dart';
import 'package:estatelqapp/features/profile_feature/data/datasources/client_remote_data_source.dart';
import 'package:estatelqapp/features/profile_feature/data/datasources/support_remote_data_source.dart';
import 'package:estatelqapp/features/profile_feature/data/repositories/client_repository.dart';
import 'package:estatelqapp/features/profile_feature/data/repositories/support_repository.dart';
import 'package:estatelqapp/features/profile_feature/domain/usecases/get_client_use_case.dart';
import 'package:estatelqapp/features/profile_feature/domain/usecases/submit_complaint_use_case.dart';
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
import 'package:estatelqapp/features/virtual_tour_feature/data/repositories/firestore_virtual_tour_repository.dart';

import 'package:estatelqapp/firebase_options.dart';
import 'package:estatelqapp/splash__page.dart';
import 'package:estatelqapp/virtual_tour_firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('authBox');
  final remoteP = PropertyCardRemoteDataSource(http.Client());
  final remotepd = PropertyDetailsRemoteDataSource(http.Client());
  final repoPd = PropertyDetailsRepositoryImpl(remotepd);
  final getPropertByIdUseCase = GetPropertyByIdUseCase(repoPd);
  final repoP = PropertyCardRepositoryImpl(remoteP);
  final useCaseP = GetPropertiesCardUseCase(repoP);
  final remoteA = AuthRemoteDataSource(http.Client());
  final repoA = AuthRepositoryImpl(remoteA);
  // final useCaseA = LoginWithGoogleUseCase(repoA);
  final loginUseCase = LoginUseCase(repoA);
  final logoutUseCase = LogoutUseCase(repoA);
  final forgotPasswordUseCase = ForgotPasswordUseCase(repoA);
  final verifyForgotPasswordOtpUseCase = VerifyForgotPasswordOtpUseCase(repoA);

  final resetPasswordUseCase = ResetPasswordUseCase(repoA);
  final signUpUseCase = SignupUseCase(repoA);
  final verifyOtpUseCase = VerifyOtpUseCase(repoA);
  final sendOtpUseCase = SendOtpUseCase(repoA);
  final remote = NotificationRemoteDataSource(http.Client());
  final repo = NotificationRepository(remote);
  final statusRemote = PropertyStatusRemoteDataSource(http.Client());
  final statusRepo = PropertyStatusRepositoryImpl(statusRemote);
  final getPropertyActivities = GetPropertyActivities(statusRepo);
  // Favorite

  final favoriteRemote = FavoriteRemoteDataSource();

  final requestRemote = RequestRemoteDataSource(http.Client());

  final requestRepo = RequestRepository(requestRemote);

  final sendRequestUseCase = SendRequestUseCase(requestRepo);

  final favoriteRepo = FavoriteRepository(favoriteRemote);

  final getFavoriteUseCase = GetFavoritePropertiesUseCase(favoriteRepo);

  final addFavoriteUseCase = AddToFavoriteUseCase(favoriteRepo);

  final clientRemote = ClientRemoteDataSource(http.Client());
  final clientRepo = ClientRepository(clientRemote);
  final getClientUseCase = GetClientUseCase(clientRepo);
  final updateProfileUseCase = UpdateProfileUseCase(clientRepo);
  WidgetsFlutterBinding.ensureInitialized();
  final supportRemote = SupportRemoteDataSource(http.Client());
  final supportRepo = SupportRepository(supportRemote);

  final submitComplaintUseCase = SubmitComplaintUseCase(supportRepo);
  final socketService = SocketService();

  final notificationRemote = NotificationRemoteDataSource(http.Client());
  final notificationRepo = NotificationRepository(notificationRemote);

  final markAsReadUseCase = MarkAsReadUseCase(notificationRepo);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Firebase.initializeApp(
    name: 'virtualTourFirebase',
    options: VirtualTourFirebaseOptions.currentPlatform,
  );
  final virtualTourFirebaseApp = Firebase.app('virtualTourFirebase');

  final virtualTourFirestore = FirebaseFirestore.instanceFor(
    app: virtualTourFirebaseApp,
  );
  final virtualTourRepository = FirestoreVirtualTourRepository(
    virtualTourFirestore,
  );
  try {
    final testSnapshot = await virtualTourFirestore
        .collection('virtual_tours')
        .limit(1)
        .get();

    print(
      '🔥 Virtual Tour Firestore test SUCCESS: '
      '${testSnapshot.docs.length} document(s) found',
    );
  } catch (e) {
    print('❌ Virtual Tour Firestore test FAILED: $e');
  }
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
          create: (_) => NotificationProvider(
            notificationRepo,
            socketService,
            markAsReadUseCase,
          )..connectSocket(),
        ),
        ChangeNotifierProvider(
          create: (_) => ClientProvider(getClientUseCase, updateProfileUseCase),
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
            forgotPasswordUseCase,
            verifyForgotPasswordOtpUseCase,
            resetPasswordUseCase,
          ),
        ),

        ChangeNotifierProvider(
          create: (_) => PropertyDetailsProvider(getPropertByIdUseCase),
        ),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),

        ChangeNotifierProvider(create: (_) => ChatWithAiProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider(socketService)),

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
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          navigatorKey: AppNavigation.navigatorKey,
          routes: {
            WelcomePage.id: (context) => WelcomePage(),
            SplashPage.id: (context) => SplashPage(),
            LoginPage.id: (context) => LoginPage(),
            SignupPage.id: (context) => SignupPage(),
            ChangePasswordPage.id: (context) => ChangePasswordPage(),
            EnterYourEmail.id: (context) => EnterYourEmail(),
            FavoritePage.id: (context) => FavoritePage(),
            RoomsLiveChatPage.id: (context) => RoomsLiveChatPage(),
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
            LiveChatPage.id: (context) => LiveChatPage(dealId: ''),
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

          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
        );
      },
    );
  }
}

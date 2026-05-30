import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/edit_profile_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/enter_your_adress_with_map_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/help_and_support_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/providers/client_provider.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/custom_button_in_profile_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/details_about_user_container.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/logout_button.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/theme_toggle_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyProfilePage extends StatefulWidget {
  const BodyProfilePage({super.key});

  @override
  State<BodyProfilePage> createState() => _BodyProfilePageState();
}

class _BodyProfilePageState extends State<BodyProfilePage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final provider = context.read<ClientProvider>();

      final id = LocalStorageService.getId();

      if (id != null) {
        provider.getClient(id.toString(), context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Consumer<ClientProvider>(
        builder: (context, provider, child) {
          final client = provider.client;

          final userName = client?.name ?? "Full Name";
          final email = client?.email ?? "Your Email";
          final location = client?.location ?? "Your Location";
          final phone = client?.phone ?? "Your Phone";

          return SingleChildScrollView(
            child: Column(
              children: [
                DetailsAboutUserContainer(
                  userName: userName,
                  email: email,
                  adress: location,
                  phoneNumber: phone,
                  imageProfile: client?.image ?? 'assets/images/person.png',
                ),

                SizedBox(height: width * 0.06),

                CustomButtonInProfilePage(
                  nameButton: 'Edit Profile',
                  onTap: () {
                    Navigator.push(
                      context,
                      SlideRight(
                        page: EditProfilePage(
                          name: userName,
                          email: email,
                          phone: phone,
                          image: client?.image ?? 'assets/images/person.png',
                          location: location,
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.person_outline,
                    size: width * 0.09,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),

                CustomButtonInProfilePage(
                  nameButton: 'Adress Management',
                  onTap: () {
                    Navigator.push(
                      context,
                      SlideRight(page: EnterYourAdressWithMapPage()),
                    );
                  },
                  icon: Icon(
                    Icons.location_on_sharp,
                    size: width * 0.09,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),

                CustomButtonInProfilePage(
                  nameButton: 'Help&Support',
                  onTap: () {
                    Navigator.push(
                      context,
                      SlideRight(page: HelpAndSupportPage()),
                    );
                  },
                  icon: Icon(
                    Icons.help,
                    size: width * 0.09,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),

                LogoutButton(),

                SizedBox(height: width * 0.2),
                ThemeToggleTile(),
                SizedBox(height: width * 0.2),
              ],
            ),
          );
        },
      ),
    );
  }
}

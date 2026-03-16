import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/edit_profile_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/enter_your_adress_with_map_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/pages/help_and_support_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/custom_button_in_profile_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/details_about_user_container.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/logout_button.dart';
import 'package:flutter/material.dart';

class BodyProfilePage extends StatelessWidget {
  const BodyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DetailsAboutUserContainer(
              userName: 'Ahmad Issa',
              email: 'ahmad123@gmail.com',
              adress: 'Homs,Alnzha',
              phoneNumber: '0983746524',
              imageProfile: 'assets/images/person.png',
            ),
            SizedBox(height: width * 0.06),

            CustomButtonInProfilePage(
              nameButton: 'Edit Profile',
              onTap: () {
                Navigator.push(context, SlideRight(page: EditProfilePage()));
              },
              icon: Icon(
                Icons.person_outline,
                size: width * 0.09,
                color: greenColor,
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
                color: greenColor,
              ),
            ),
            CustomButtonInProfilePage(
              nameButton: 'Help&Support',
              onTap: () {
                Navigator.push(context, SlideRight(page: HelpAndSupportPage()));
              },
              icon: Icon(Icons.help, size: width * 0.09, color: greenColor),
            ),
            LogoutButton(),

            SizedBox(height: width * 0.2),
          ],
        ),
      ),
    );
  }
}

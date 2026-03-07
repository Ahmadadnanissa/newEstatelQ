import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/core/widgets/secondary_button.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user2.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/custom_container_for_b_r_s.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/sub_title_page.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/title_page.dart';
import 'package:flutter/material.dart';

class Body1 extends StatefulWidget {
  const Body1({super.key});

  @override
  State<Body1> createState() => _Body1State();
}

class _Body1State extends State<Body1> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitlePage(title: 'What are you looking for ?'),
            SubTitlePage(
              subTitle:
                  'we’ll  start with these listings.you can change this later.',
            ),

            Padding(
              padding: EdgeInsets.only(top: width * 0.08, bottom: width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomContainerForBRS(
                    image: 'assets/images/buy.png',
                    name: 'Buy',
                    onTap: () {},
                  ),
                  SizedBox(width: width * 0.05),
                  CustomContainerForBRS(
                    image: 'assets/images/rent.png',
                    name: 'Rent',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: width * 0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomContainerForBRS(
                    image: 'assets/images/buy.png',
                    name: 'Buy',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            SizedBox(height: width * 0.35),

            PrimaryButton(
              name: 'Next',
              pushing: () {
                Navigator.push(context, SlideRight(page: GetinfoFromUser2()));
              },
            ),
            SizedBox(height: width * 0.04),
            SecondaryButton(name: 'Skip', pushing: () {}),
          ],
        ),
      ),
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/core/widgets/secondary_button.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user2.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/custom_container_for_b_r_s.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/sub_title_page.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/title_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/navigation_page.dart';
import 'package:flutter/material.dart';

class Body1 extends StatefulWidget {
  const Body1({super.key});

  @override
  State<Body1> createState() => _Body1State();
}

class _Body1State extends State<Body1> {
  String isSelected = 'buy';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
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
                padding: EdgeInsets.only(
                  top: width * 0.08,
                  bottom: width * 0.03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        isSelected = 'buy';
                        setState(() {});
                      },
                      child: CustomContainerForBRS(
                        image: 'assets/images/buy.png',
                        name: 'Buy',
                        widthOfContainer: isSelected == 'buy' ? 0.32 : 0.3,
                        color: isSelected == 'buy'
                            ? secondaryColor
                            : greenColor,
                      ),
                    ),
                    SizedBox(width: width * 0.052),
                    GestureDetector(
                      onTap: () {
                        isSelected = 'rent';
                        setState(() {});
                      },
                      child: CustomContainerForBRS(
                        image: 'assets/images/rent.png',
                        name: 'Rent',
                        widthOfContainer: isSelected == 'rent' ? 0.32 : 0.3,
                        color: isSelected == 'rent'
                            ? secondaryColor
                            : greenColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: width * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        isSelected = 'sale';
                        setState(() {});
                      },
                      child: CustomContainerForBRS(
                        image: 'assets/images/salee.png',
                        name: 'Sale',
                        widthOfContainer: isSelected == 'sale' ? 0.32 : 0.3,
                        color: isSelected == 'sale'
                            ? secondaryColor
                            : greenColor,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: width * 0.35),

              PrimaryButton(
                name: 'Next',
                pushing: () async {
                  Navigator.push(
                    context,
                    SlideRight(
                      page: GetinfoFromUser2(selectedType: isSelected),
                    ),
                  );
                  // ignore: avoid_print
                  print(isSelected);
                },
              ),
              SizedBox(height: width * 0.04),
              SecondaryButton(
                name: 'Skip',
                pushing: () {
                  Navigator.push(context, SlideRight(page: NavigationPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

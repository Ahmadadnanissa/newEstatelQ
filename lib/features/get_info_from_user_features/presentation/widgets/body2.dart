import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/core/widgets/secondary_button.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user3.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/form_field_for_location.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/sub_title_page.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/title_page.dart';
import 'package:flutter/material.dart';

class Body2 extends StatefulWidget {
  const Body2({super.key});

  @override
  State<Body2> createState() => _Body2State();
}

class _Body2State extends State<Body2> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitlePage(title: 'Where are you looking ?'),
            SubTitlePage(
              subTitle: 'you can enter cities,neighborhoods,zip codes,and more',
            ),
            FormFieldForLocation(),

            SizedBox(height: width * 0.95),
            PrimaryButton(
              name: 'Next',
              pushing: () {
                Navigator.push(context, SlideRight(page: GetinfoFromUser3()));
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

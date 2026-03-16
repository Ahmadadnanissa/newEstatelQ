import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/core/widgets/secondary_button.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user4.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/price_range.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/sub_title_page.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/title_page.dart';
import 'package:flutter/material.dart';

class Body3 extends StatefulWidget {
  const Body3({super.key});

  @override
  State<Body3> createState() => _Body3State();
}

class _Body3State extends State<Body3> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitlePage(title: 'What’s youe price range ?'),
            SubTitlePage(
              subTitle:
                  'this is just to get you started.you can change this later.',
            ),
            PriceRaange(),

            SizedBox(height: width * 0.75),
            PrimaryButton(
              name: 'Next',
              pushing: () {
                Navigator.push(context, SlideRight(page: GetinfoFromUser4()));
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

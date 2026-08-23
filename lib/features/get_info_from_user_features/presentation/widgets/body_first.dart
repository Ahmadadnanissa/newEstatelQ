import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user1.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/onboardingIllustraion.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/sub_title_page.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/title_page.dart';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class BodyFirst extends StatefulWidget {
  const BodyFirst({super.key});

  @override
  State<BodyFirst> createState() => _BodyFirstState();
}

class _BodyFirstState extends State<BodyFirst> {
  final Uuid uuid = Uuid();

  String isSelected = 'buy';

  // لمنع تنفيذ أكثر من Swipe أثناء الانتقال

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
              SizedBox(height: width * 0.05),

              OnboardingIllustration(
                imagePath: 'assets/images/Houses-pana (1).png',
              ),

              SizedBox(height: width * 0.035),

              TitlePage(title: 'Find Your Place. Make It Yours.'),

              SizedBox(height: width * 0.02),

              SubTitlePage(
                subTitle:
                    'Discover properties that match your needs and start your journey with us.',
              ),

              // مساحة إضافية حتى لا يتداخل المحتوى مع الزر
              SizedBox(height: width * 0.22),

              Padding(
                padding: EdgeInsets.only(
                  bottom: width * 0.04,
                  top: width * 0.05,
                ),
                child: PrimaryButton(
                  name: 'Get Started',
                  pushing: () async {
                    final guestId = uuid.v4();

                    await LocalStorageService.saveUser(
                      id: guestId, // أو تخليه String إذا بدك (أفضل لاحقاً)
                      name: "Guest",
                      email: "guest@local",
                    );

                    await LocalStorageService.saveUserType("guest");

                    Navigator.push(
                      context,
                      SlideRight(page: GetinfoFromUser1()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

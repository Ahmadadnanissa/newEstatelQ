import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/core/widgets/secondary_button.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user3.dart';
import 'package:estatelqapp/core/widgets/form_field_for_location.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/sub_title_page.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/title_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/navigation_page.dart';
import 'package:flutter/material.dart';

class Body2 extends StatefulWidget {
  const Body2({super.key, this.selectedType});
  final String? selectedType;
  @override
  State<Body2> createState() => _Body2State();
}

class _Body2State extends State<Body2> {
  TextEditingController locationController = TextEditingController();
  String? selectedLocation;

  @override
  void dispose() {
    locationController.dispose();

    super.dispose();
  }

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
              TitlePage(title: 'Where are you looking ?'),
              SubTitlePage(
                subTitle:
                    'you can enter cities,neighborhoods,zip codes,and more',
              ),
              FormFieldForLocation(controller: locationController),

              SizedBox(height: width + width * 0.08),
              PrimaryButton(
                name: 'Next',
                pushing: () {
                  String? location = locationController.text;
                  Navigator.push(
                    context,
                    SlideRight(
                      page: GetinfoFromUser3(
                        selectedLocation: location,
                        selectedType: widget.selectedType,
                      ),
                    ),
                  );

                  // ignore: avoid_print
                  print(location);
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

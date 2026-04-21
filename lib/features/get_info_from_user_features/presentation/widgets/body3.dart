import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/core/widgets/secondary_button.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user4.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/price_range.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/sub_title_page.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/title_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/navigation_page.dart';
import 'package:flutter/material.dart';

class Body3 extends StatefulWidget {
  const Body3({super.key, this.selectedType, this.selectedLocation});
  final String? selectedType;
  final String? selectedLocation;
  @override
  State<Body3> createState() => _Body3State();
}

class _Body3State extends State<Body3> {
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();

  @override
  void dispose() {
    maxPriceController.dispose();
    minPriceController.dispose();
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
              TitlePage(title: 'What’s youe price range ?'),
              SubTitlePage(
                subTitle:
                    'this is just to get you started.you can change this later.',
              ),
              PriceRaange(
                minController: minPriceController,
                maxController: maxPriceController,
              ),

              SizedBox(height: width * 0.75),
              PrimaryButton(
                name: 'Next',
                pushing: () {
                  String min = minPriceController.text;
                  String max = maxPriceController.text;
                  Navigator.push(
                    context,
                    SlideRight(
                      page: GetinfoFromUser4(
                        minPrice: min,
                        maxPrice: max,
                        selectedLocation: widget.selectedLocation,
                        selectedType: widget.selectedType,
                      ),
                    ),
                  );

                  // ignore: avoid_print
                  print("Min: $min");
                  // ignore: avoid_print
                  print("Max: $max");
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

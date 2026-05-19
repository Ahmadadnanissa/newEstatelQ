// ignore_for_file: avoid_print

import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/core/widgets/secondary_button.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/check_number_of_room.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/sub_title_page.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/title_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/navigation_page.dart';
import 'package:flutter/material.dart';

class Body4 extends StatefulWidget {
  const Body4({
    super.key,
    this.selectedType,
    this.selectedLocation,
    this.minPrice,
    this.maxPrice,
  });
  final String? selectedType;
  final String? selectedLocation;
  final String? minPrice;
  final String? maxPrice;
  @override
  State<Body4> createState() => _Body4State();
}

class _Body4State extends State<Body4> {
  TextEditingController roomController = TextEditingController();

  @override
  void dispose() {
    roomController.dispose();

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
              TitlePage(title: 'How many beds?'),

              SubTitlePage(
                subTitle:
                    'this is just to get you started.you can change this later.',
              ),
              CheckNumberOfRoom(controller: roomController),

              SizedBox(height: width + width * 0.05),

              PrimaryButton(
                name: 'Next',
                pushing: () async {
                  String? numberOFroom = roomController.text;
                  print(numberOFroom);
                  print(widget.selectedLocation);
                  print(widget.selectedType);
                  print(widget.minPrice);
                  print(widget.maxPrice);
                  Navigator.pushAndRemoveUntil(
                    context,
                    SlideRight(page: NavigationPage()),
                    (route) => false,
                  );
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

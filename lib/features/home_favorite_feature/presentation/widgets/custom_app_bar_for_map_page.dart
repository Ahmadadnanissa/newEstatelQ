import 'package:estatelqapp/core/widgets/form_field_for_location.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/filter_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/filter_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBarForMapPage extends StatelessWidget {
  const CustomAppBarForMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: FormFieldForLocation()),
        GestureDetector(
          onTap: () {
            Navigator.push(context, SlideRight(page: FilterPage()));
          },
          child: FilterIcon(),
        ),
      ],
    );
  }
}

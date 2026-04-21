import 'package:estatelqapp/core/widgets/form_field_for_location.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/filter_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/provider/home_provider.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/filter_icon.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/list_of_custom_card_property.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/row_for_type_of_property.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({super.key});

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      // ignore: use_build_context_synchronously
      Provider.of<HomeProvider>(context, listen: false).loadProperties();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
        ),
        RowForTypeOfProperty(),
        Divider(thickness: 0.8),

        Expanded(child: ListOfCustomCardProperty()),
      ],
    );
  }
}

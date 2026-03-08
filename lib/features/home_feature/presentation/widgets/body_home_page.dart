import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/core/widgets/form_field_for_location.dart';
import 'package:estatelqapp/features/home_feature/presentation/widgets/filter_icon.dart';
import 'package:estatelqapp/features/home_feature/presentation/widgets/list_of_custom_card_property.dart';
import 'package:estatelqapp/features/home_feature/presentation/widgets/list_of_more_details.dart';
import 'package:estatelqapp/features/home_feature/presentation/widgets/more_details_for_property_card.dart';
import 'package:estatelqapp/features/home_feature/presentation/widgets/row_for_type_of_property.dart';
import 'package:flutter/material.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({super.key});

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: FormFieldForLocation()),
            GestureDetector(onTap: () {}, child: FilterIcon()),
          ],
        ),
        RowForTypeOfProperty(),
        Divider(thickness: 0.5),

        Expanded(child: ListOfCustomCardProperty()),
      ],
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/customm_app_bar.dart.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/body_property_status_page.dart';
import 'package:flutter/material.dart';

class PropertyStatusPage extends StatelessWidget {
  const PropertyStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustommAppBar(
        title: 'My Property Status',
        sizeTitle: width * 0.06,
        iconLeading: Icon(
          Icons.chevron_left,
          color: secondaryColor,
          size: width * 0.1,
        ),
        onTapleading: () {
          Navigator.pop(context);
        },
      ),
      body: BodyPropertyStatusPage(),
    );
  }
}

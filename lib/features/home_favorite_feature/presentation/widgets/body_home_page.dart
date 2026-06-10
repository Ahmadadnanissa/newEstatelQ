import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/core/widgets/search_about_property_home_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/filter_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/provider/home_provider.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/filter_icon.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/list_of_custom_card_property.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/row_for_type_of_property.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/notification_provider.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notificationProvider = context.read<NotificationProvider>();

      final id = LocalStorageService.getId();
      final type = LocalStorageService.getUserType();

      notificationProvider.connectSocket(id!, type!);
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
            Expanded(child: SearchAboutPropertyHomePage()),
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

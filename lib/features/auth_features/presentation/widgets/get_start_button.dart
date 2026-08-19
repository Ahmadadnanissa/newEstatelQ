import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/core/services/visitor_local_storage.dart';
import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';

import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:uuid/uuid.dart';

class GetStartButton extends StatefulWidget {
  const GetStartButton({super.key});

  @override
  State<GetStartButton> createState() => _GetStartButtonState();
}

class _GetStartButtonState extends State<GetStartButton> {
  final Uuid uuid = Uuid();
  Future<void> createVisitor() async {
    final info = NetworkInfo();

    // Get device IP
    final ip = await info.getWifiIP();

    if (ip != null) {
      await VisitorLocalStorageService.saveIp(ip);
    }

    // Get visitor creation time
    final createdAt = DateTime.now().toIso8601String();

    await VisitorLocalStorageService.saveCreatedAt(createdAt);

    // بعد هيك كمل الانتقال للتطبيق
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.04, top: width * 0.17),
      child: PrimaryButton(
        name: 'Get Start',
        pushing: () async {
          await createVisitor();

          final guestId = uuid.v4();

          await LocalStorageService.saveUser(
            id: guestId, // أو تخليه String إذا بدك (أفضل لاحقاً)
            name: "Guest",
            email: "guest@local",
          );

          await LocalStorageService.saveUserType("guest");

          Navigator.push(context, SlideRight(page: NavigationPage()));
        },
      ),
    );
  }
}

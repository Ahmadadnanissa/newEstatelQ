import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/body1.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/custom_app_bar_for_get_info.dart';
import 'package:flutter/material.dart';

class GetinfoFromUser1 extends StatefulWidget {
  const GetinfoFromUser1({super.key});
  static String id = 'GetinfoFromUser1';

  @override
  State<GetinfoFromUser1> createState() => _GetinfoFromUser1State();
}

class _GetinfoFromUser1State extends State<GetinfoFromUser1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: CustomAppBarForGetInfo(title: '1 0f 4'),
      body: Body1(),
    );
  }
}

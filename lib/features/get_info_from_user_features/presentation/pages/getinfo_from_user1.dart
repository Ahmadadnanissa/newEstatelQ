import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_app_bar.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/body1.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: CustomAppBar(
          title: '1 0f 4',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        body: Body1(),
      ),
    );
  }
}

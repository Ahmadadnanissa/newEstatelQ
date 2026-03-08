import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_app_bar.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/body2.dart';
import 'package:flutter/material.dart';

class GetinfoFromUser2 extends StatefulWidget {
  const GetinfoFromUser2({super.key});
  static String id = 'GetinfoFromUser2';

  @override
  State<GetinfoFromUser2> createState() => _GetinfoFromUser2State();
}

class _GetinfoFromUser2State extends State<GetinfoFromUser2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: CustomAppBar(
          title: '2 0f 4',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        body: Body2(),
      ),
    );
  }
}

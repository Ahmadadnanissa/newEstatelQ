import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_app_bar.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/body4.dart';
import 'package:flutter/material.dart';

class GetinfoFromUser4 extends StatefulWidget {
  const GetinfoFromUser4({super.key});
  static String id = 'GetinfoFromUser4';

  @override
  State<GetinfoFromUser4> createState() => _GetinfoFromUser4State();
}

class _GetinfoFromUser4State extends State<GetinfoFromUser4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: CustomAppBar(title: '4 0f 4'),
      body: Body4(),
    );
  }
}

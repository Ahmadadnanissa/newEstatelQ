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
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Body1(),
    );
  }
}

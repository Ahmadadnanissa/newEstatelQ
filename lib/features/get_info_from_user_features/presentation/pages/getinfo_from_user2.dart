import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/body2.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/custom_app_bar_for_get_info.dart';
import 'package:flutter/material.dart';

class GetinfoFromUser2 extends StatefulWidget {
  const GetinfoFromUser2({super.key, this.selectedType});
  static String id = 'GetinfoFromUser2';
  final String? selectedType;

  @override
  State<GetinfoFromUser2> createState() => _GetinfoFromUser2State();
}

class _GetinfoFromUser2State extends State<GetinfoFromUser2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBarForGetInfo(title: '2 0f 4'),

      body: Body2(selectedType: widget.selectedType),
    );
  }
}

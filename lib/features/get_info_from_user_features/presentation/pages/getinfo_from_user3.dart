import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/body3.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/custom_app_bar_for_get_info.dart';
import 'package:flutter/material.dart';

class GetinfoFromUser3 extends StatefulWidget {
  const GetinfoFromUser3({super.key, this.selectedType, this.selectedLocation});
  static String id = 'GetinfoFromUser3';
  final String? selectedType;
  final String? selectedLocation;

  @override
  State<GetinfoFromUser3> createState() => _GetinfoFromUser3State();
}

class _GetinfoFromUser3State extends State<GetinfoFromUser3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: CustomAppBarForGetInfo(title: '3 0f 4'),
      body: Body3(
        selectedLocation: widget.selectedLocation,
        selectedType: widget.selectedType,
      ),
    );
  }
}

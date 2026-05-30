import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/body4.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/custom_app_bar_for_get_info.dart';
import 'package:flutter/material.dart';

class GetinfoFromUser4 extends StatefulWidget {
  const GetinfoFromUser4({
    super.key,
    this.selectedType,
    this.selectedLocation,
    this.minPrice,
    this.maxPrice,
  });
  static String id = 'GetinfoFromUser4';
  final String? selectedType;
  final String? selectedLocation;
  final String? minPrice;
  final String? maxPrice;

  @override
  State<GetinfoFromUser4> createState() => _GetinfoFromUser4State();
}

class _GetinfoFromUser4State extends State<GetinfoFromUser4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBarForGetInfo(title: '4 0f 4'),

      body: Body4(
        minPrice: widget.minPrice,
        maxPrice: widget.maxPrice,
        selectedLocation: widget.selectedLocation,
        selectedType: widget.selectedType,
      ),
    );
  }
}

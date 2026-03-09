import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class FilterIcon extends StatefulWidget {
  const FilterIcon({super.key});

  @override
  State<FilterIcon> createState() => _FilterIconState();
}

class _FilterIconState extends State<FilterIcon> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        right: width * 0.04,
        top: width * 0.04,
        bottom: width * 0.04,
      ),
      child: Container(
        width: width * 0.12,
        height: width * 0.11,

        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: secondaryColor, width: 0.5),
        ),
        child: Icon(
          Icons.filter_list,
          color: secondaryColor,
          size: width * 0.09,
        ),
      ),
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class RowForSeeActivityInPropertyStatus extends StatelessWidget {
  const RowForSeeActivityInPropertyStatus({
    super.key,
    this.onTapRecentActivities,
    this.onTapViewAll,
  });
  final void Function()? onTapRecentActivities;
  final void Function()? onTapViewAll;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTapRecentActivities,
            child: CustomFont(
              name: 'Recent activities',
              fontColor: blackColor,
              fontSize: width * 0.04,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: onTapViewAll,
            child: CustomFont(
              name: 'view All',
              fontColor: secondaryColor,
              fontSize: width * 0.04,
            ),
          ),
        ],
      ),
    );
  }
}

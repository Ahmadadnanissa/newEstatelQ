import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowForNavigationBetweenLoginAndSignup extends StatefulWidget {
  RowForNavigationBetweenLoginAndSignup({
    super.key,
    required this.name,
    required this.onTap,
    required this.subTitle,
  });
  String name;
  String subTitle;
  void Function()? onTap;

  @override
  State<RowForNavigationBetweenLoginAndSignup> createState() =>
      _RowForNavigationBetweenLoginAndSignupState();
}

class _RowForNavigationBetweenLoginAndSignupState
    extends State<RowForNavigationBetweenLoginAndSignup> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.09),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomFont(
            name: widget.subTitle,
            fontColor: greenColor,
            fontSize: width * 0.05,
          ),
          GestureDetector(
            onTap: widget.onTap,
            child: CustomFont(
              name: widget.name,
              fontColor: secondaryColor,
              fontSize: width * 0.05,
            ),
          ),
        ],
      ),
    );
  }
}

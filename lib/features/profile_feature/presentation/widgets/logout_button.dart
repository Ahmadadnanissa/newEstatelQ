import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: width * 0.02,
        horizontal: width * 0.075,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: width * 0.14,
              width: width * 0.35,
              decoration: BoxDecoration(
                color: primaryColor,
                border: Border.all(color: greenColor, width: 1),
                borderRadius: BorderRadius.circular(width * 0.01),
              ),

              child: Row(
                children: [
                  Icon(
                    Icons.logout_rounded,
                    size: width * 0.09,
                    color: Colors.red,
                  ),
                  SizedBox(width: width * 0.04),
                  CustomFont(
                    name: 'Log Out',
                    fontColor: Color(0xff5F6264),
                    fontSize: width * 0.045,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

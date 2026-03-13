import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class BodyOfNotification extends StatelessWidget {
  const BodyOfNotification({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: blackColor.withValues(alpha: 0.2),
              offset: Offset(0, 3),
              blurRadius: 10,
            ),
          ],
          color: primaryColor,
          borderRadius: BorderRadius.circular(width * 0.01),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: CircleAvatar(
                radius: width * 0.09,
                backgroundImage: AssetImage(image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomFont(
                    name: title,
                    fontColor: blackColor,
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: width * 0.7,

                    child: Text(
                      subTitle,
                      textAlign: TextAlign.start,
                      softWrap: true,

                      style: TextStyle(
                        color: Color(0xff5F6264),
                        fontSize: width * 0.03,
                        fontFamily: fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

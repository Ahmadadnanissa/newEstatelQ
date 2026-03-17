import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class TypeButtonReviewsWidget extends StatelessWidget {
  const TypeButtonReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(width * 0.03),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Image.asset(
                'assets/images/Building.png',
                width: width * 0.1,
                height: width * 0.1,
              ),
              CustomFont(
                name: 'Apartments',
                fontColor: Color(0xff5F6264),
                fontSize: width * 0.03,
              ),
            ],
          ),
          Spacer(),
          Container(
            width: width * 0.0008,
            height: width * 0.2,
            color: Color(0xff5F6264),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.reviews,
                    color: secondaryColor,
                    size: width * 0.06,
                  ),
                  SizedBox(width: width * 0.01),
                  CustomFont(
                    name: '200 review',
                    fontColor: Color(0xff5F6264),
                    fontSize: width * 0.035,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                    size: width * 0.06,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                    size: width * 0.06,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                    size: width * 0.06,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                    size: width * 0.06,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                    size: width * 0.06,
                  ),
                ],
              ),
              CustomFont(
                name: '10.0',
                fontColor: Color(0xff5F6264),
                fontSize: width * 0.04,
              ),
            ],
          ),
          Spacer(),
          Container(
            width: width * 0.0008,
            height: width * 0.2,
            color: Color(0xff5F6264),
          ),
          Spacer(),
          CustomButton(name: 'Book Now', pushing: () {}),
        ],
      ),
    );
  }
}

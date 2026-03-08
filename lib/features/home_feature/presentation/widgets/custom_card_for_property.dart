import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/home_feature/presentation/widgets/list_of_more_details.dart';
import 'package:flutter/material.dart';

class CustomCardForProperty extends StatelessWidget {
  const CustomCardForProperty({
    super.key,
    required this.image,
    required this.title,
    required this.address,
    required this.price,
    required this.type,
    required this.numberOfRooms,
    required this.numberOfPath,
    required this.sqft,
  });
  final String image;
  final String title;
  final String address;
  final String price;
  final String type;
  final int numberOfRooms;
  final int numberOfPath;
  final int sqft;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,

        borderRadius: BorderRadius.circular(width * 0.05),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(width * 0.05),
            ),
            child: Image.asset(
              image,
              width: double.infinity,
              height: width * 0.35,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: width * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomFont(
                      name: title,
                      fontColor: blackColor,
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomFont(
                      name: address,
                      fontColor: Color(0xff5F6264),
                      fontSize: width * 0.03,
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomFont(
                      name: price,
                      fontColor: blackColor,
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomFont(
                      name: type,
                      fontColor: Color(0xff5F6264),
                      fontSize: width * 0.03,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: width * 0.01),
            child: ListOfMoreDetails(
              numberOfPath: numberOfPath,
              numberOfRoom: numberOfRooms,
              sqft: sqft,
            ),
          ),
        ],
      ),
    );
  }
}

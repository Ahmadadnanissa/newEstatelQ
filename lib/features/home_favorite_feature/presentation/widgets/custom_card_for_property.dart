import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/list_of_more_details.dart';
import 'package:flutter/material.dart';

class CustomCardForProperty extends StatefulWidget {
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
  State<CustomCardForProperty> createState() => _CustomCardForPropertyState();
}

class _CustomCardForPropertyState extends State<CustomCardForProperty> {
  bool isFavorite = false;
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
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(width * 0.05),
                ),
                child: Image.asset(
                  widget.image,
                  width: double.infinity,
                  height: width * 0.38,
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: width * 0.08,
                      width: width * 0.23,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                      child: Center(
                        child: CustomFont(
                          name: widget.type,
                          fontColor: blackColor,
                          fontSize: width * 0.035,
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.share, size: width * 0.09),
                    GestureDetector(
                      onTap: () {
                        isFavorite = !isFavorite;
                        setState(() {});
                      },
                      child: isFavorite
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: width * 0.09,
                            )
                          : Icon(Icons.favorite, size: width * 0.09),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: width * 0.03,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFont(
                      name: widget.title,
                      fontColor: blackColor,
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomFont(
                      name: widget.address,
                      fontColor: Color(0xff5F6264),
                      fontSize: width * 0.035,
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFont(
                      name: widget.price,
                      fontColor: blackColor,
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomFont(
                      name: 'For Sale',
                      // widget.type
                      fontColor: Color(0xff5F6264),
                      fontSize: width * 0.035,
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListOfMoreDetails(
            numberOfPath: widget.numberOfPath,
            numberOfRoom: widget.numberOfRooms,
            sqft: widget.sqft,
          ),

          SizedBox(height: width * 0.03),
        ],
      ),
    );
  }
}

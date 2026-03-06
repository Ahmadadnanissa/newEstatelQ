import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class CheckNumberOfRoom extends StatefulWidget {
  const CheckNumberOfRoom({super.key});

  @override
  State<CheckNumberOfRoom> createState() => _CheckNumberOfRoomState();
}

class _CheckNumberOfRoomState extends State<CheckNumberOfRoom> {
  int selectedIndex = -1;

  List<int> beds = List.generate(15, (index) => index + 1);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(width * 0.04),

      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = -1;
              });
            },

            child: Container(
              width: width * 0.25,
              height: width * 0.13,

              decoration: BoxDecoration(
                color: secondaryColor,

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(width * 0.03),
                  bottomLeft: Radius.circular(width * 0.03),
                ),
              ),

              child: Center(
                child: Text(
                  'Studio+',
                  style: TextStyle(
                    color: primaryColor,

                    fontFamily: fontFamily,
                    fontSize: width * 0.05,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              height: width * 0.13,

              decoration: BoxDecoration(
                color: Color(0xffEDF6F9),

                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(width * 0.03),
                  bottomRight: Radius.circular(width * 0.03),
                ),
              ),

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: beds.length,
                shrinkWrap: true,

                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },

                    child: Container(
                      width: width * 0.13,

                      alignment: Alignment.center,

                      child: Text(
                        "+${beds[index]}",

                        style: TextStyle(
                          color: isSelected
                              ? secondaryColor
                              : secondaryColor.withOpacity(0.8),

                          fontFamily: fontFamily,
                          fontSize: width * 0.045,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

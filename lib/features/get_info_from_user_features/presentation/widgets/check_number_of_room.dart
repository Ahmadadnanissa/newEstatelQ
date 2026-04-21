import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class CheckNumberOfRoom extends StatefulWidget {
  final TextEditingController? controller;

  const CheckNumberOfRoom({super.key, this.controller});

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
          /// Studio Button
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = -1;
              });

              // 🔥 تخزين القيمة
              widget.controller?.text = "studio";
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

          /// Numbers
          Expanded(
            child: Container(
              height: width * 0.13,
              decoration: BoxDecoration(
                color: const Color(0xffEDF6F9),
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

                      // 🔥 تخزين الرقم
                      widget.controller?.text = beds[index].toString();
                    },
                    child: Container(
                      width: width * 0.13,
                      alignment: Alignment.center,
                      child: Text(
                        "+${beds[index]}",
                        style: TextStyle(
                          color: isSelected
                              ? secondaryColor
                              // ignore: deprecated_member_use
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

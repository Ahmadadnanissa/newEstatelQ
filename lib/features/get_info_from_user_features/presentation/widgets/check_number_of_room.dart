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

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.all(width * 0.04),

      child: Row(
        children: [
          // ================= STUDIO BUTTON =================
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = -1;
              });

              // 🔥 تخزين القيمة
              widget.controller?.text = "studio";
            },

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),

              width: width * 0.28,
              height: width * 0.14,

              decoration: BoxDecoration(
                color: secondaryColor,

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(width * 0.04),

                  bottomLeft: Radius.circular(width * 0.04),
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.12 : 0.08),

                    blurRadius: 8,

                    offset: const Offset(0, 3),
                  ),
                ],
              ),

              child: Center(
                child: Text(
                  'Studio+',

                  style: TextStyle(
                    color: primaryColor,

                    fontFamily: fontFamily,

                    fontSize: width * 0.047,

                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),

          // ================= NUMBERS SECTION =================
          Expanded(
            child: Container(
              height: width * 0.14,

              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,

                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(width * 0.04),

                  bottomRight: Radius.circular(width * 0.04),
                ),

                border: Border.all(
                  color: isDark
                      ? darkSurfaceColor
                      : greenColor.withValues(alpha: 0.35),
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.10 : 0.05),

                    blurRadius: 8,

                    offset: const Offset(0, 3),
                  ),
                ],
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

                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),

                      width: width * 0.14,

                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        color: isSelected
                            ? secondaryColor.withValues(alpha: 0.12)
                            : Colors.transparent,

                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Text(
                        "+${beds[index]}",

                        style: TextStyle(
                          color: isSelected
                              ? secondaryColor
                              : Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.7),

                          fontFamily: fontFamily,

                          fontSize: width * 0.043,

                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.w500,
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

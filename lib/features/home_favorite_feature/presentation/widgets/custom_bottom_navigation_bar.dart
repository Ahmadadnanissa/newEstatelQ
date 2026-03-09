import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.2),
      child: Container(
        height: width * 0.12,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildItem(icon: Icons.favorite_border, index: 1, width: width),

            buildItem(icon: Icons.home_outlined, index: 0, width: width),

            buildItem(icon: Icons.person_outline, index: 2, width: width),
          ],
        ),
      ),
    );
  }

  Widget buildItem({
    required IconData icon,
    required int index,
    required double width,
  }) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        onTap(index);
      },

      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        curve: Curves.easeInOut,

        padding: EdgeInsets.all(width * 0.01),

        decoration: BoxDecoration(
          color: isSelected ? Color(0xffFFDDD2) : primaryColor,
          shape: BoxShape.circle,
        ),

        child: Icon(icon, size: width * 0.09),
      ),
    );
  }
}

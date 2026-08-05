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
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        SizedBox(width: width * 0.238),
        Container(
          width: width * 0.6,
          height: width * 0.12, // 🔥 أصغر
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 15,
                offset: const Offset(0, 6),
              ),
            ],
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildItem(
                icon: Icons.favorite_border,
                index: 1,
                width: width,
                colorScheme: colorScheme,
              ),
              buildItem(
                icon: Icons.home_outlined,
                index: 0,
                width: width,
                colorScheme: colorScheme,
              ),
              buildItem(
                icon: Icons.person_outline,
                index: 2,
                width: width,
                colorScheme: colorScheme,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildItem({
    required IconData icon,
    required int index,
    required double width,
    required ColorScheme colorScheme,
  }) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,

        padding: EdgeInsets.all(width * 0.015),

        decoration: BoxDecoration(
          color: isSelected ? colorScheme.secondary : Colors.transparent,
          shape: BoxShape.circle,
        ),

        child: Icon(
          icon,
          size: width * 0.09, // 🔥 أصغر بكثير
          color: isSelected
              ? colorScheme.onSecondary
              : colorScheme.onPrimary.withValues(alpha: 0.7),
        ),
      ),
    );
  }
}

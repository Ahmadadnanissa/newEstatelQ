import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class BuyOrRentCustomContainer extends StatelessWidget {
  const BuyOrRentCustomContainer({
    super.key,
    required this.icon,
    required this.forWhat,
    required this.isSelected,
  });

  final IconData icon;
  final String forWhat;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.44,
      height: width * 0.24,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            offset: const Offset(0, 3),
            blurRadius: 10,
          ),
        ],
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(width * 0.03),
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: width * 0.14,
              color: isSelected
                  ? Colors.white
                  : Theme.of(context).colorScheme.primary,
            ),

            SizedBox(height: width * 0.01),

            CustomFont(
              name: forWhat,
              fontColor: isSelected
                  ? Colors.white
                  : Theme.of(context).colorScheme.onSurface,
              fontSize: width * 0.04,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}

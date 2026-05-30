import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class ProperyTypeCheckInFilter extends StatelessWidget {
  const ProperyTypeCheckInFilter({
    super.key,
    required this.icon,
    required this.type,
    required this.isSelected,
  });

  final IconData icon;
  final String type;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.9,
      height: width * 0.13,
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

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: width * 0.03),

          Icon(
            icon,
            size: width * 0.08,
            color: isSelected
                ? Colors.white
                : Theme.of(context).colorScheme.primary,
          ),

          SizedBox(width: width * 0.03),

          CustomFont(
            name: type,
            fontColor: isSelected
                ? Colors.white
                : Theme.of(context).colorScheme.onSurface,
            fontSize: width * 0.045,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}

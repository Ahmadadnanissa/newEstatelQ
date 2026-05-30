import 'package:flutter/material.dart';
import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';

class TypeOfProperty extends StatelessWidget {
  const TypeOfProperty({
    super.key,
    required this.icon,
    required this.type,
    required this.backgroundColor,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String type;
  final Color backgroundColor;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.01),
      child: InkWell(
        borderRadius: BorderRadius.circular(width * 0.03),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isSelected ? colorScheme.primary : colorScheme.surface,
            borderRadius: BorderRadius.circular(width * 0.03),
            border: Border.all(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.outline.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: width * 0.012,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: width * 0.06,
                  color: isSelected
                      ? colorScheme.onPrimary
                      : colorScheme.primary,
                ),

                SizedBox(width: width * 0.015),

                CustomFont(
                  name: type,
                  fontColor: isSelected
                      ? colorScheme.onPrimary
                      : colorScheme.onSurface,
                  fontSize: width * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(
        right: width * 0.04,
        top: width * 0.04,
        bottom: width * 0.04,
      ),
      child: Container(
        width: width * 0.12,
        height: width * 0.11,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          Icons.tune_rounded,
          color: colorScheme.primary,
          size: width * 0.09,
        ),
      ),
    );
  }
}

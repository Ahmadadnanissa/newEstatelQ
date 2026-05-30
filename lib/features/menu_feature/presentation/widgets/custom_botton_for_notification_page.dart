import 'package:flutter/material.dart';

class CustomBottonForNotificationPage extends StatelessWidget {
  const CustomBottonForNotificationPage({
    super.key,
    required this.name,
    this.number,
  });

  final String name;
  final int? number;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isActive = name == 'All' || (number == 0);

    return Container(
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surface,

        borderRadius: BorderRadius.circular(width * 0.04),
      ),

      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Text(
              name,
              style: TextStyle(
                color: isActive
                    ? Colors.white
                    : Theme.of(context).colorScheme.onSurface,
                fontSize: width * 0.042,
              ),
            ),
          ),

          // Badge
          if (number != null && number! > 0)
            Positioned(
              right: -6,
              top: -6,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  number.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

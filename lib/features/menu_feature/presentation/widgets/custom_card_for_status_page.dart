import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/menu_feature/domain/entity/property_activity.dart';
import 'package:flutter/material.dart';

class CustomCardForStatusPage extends StatelessWidget {
  const CustomCardForStatusPage({super.key, required this.activity});

  final PropertyActivity activity;

  Color checkColor(PropertyActivity activity) {
    switch (activity.status) {
      case 'started':
        return const Color(0xFF457B9D);

      case 'pending':
        return const Color(0xFFF4A261);

      case 'failed':
        return const Color(0xFFE63946);

      case 'success':
        return const Color(0xFF2A9D8F);

      default:
        return const Color(0xFF8D99AE);
    }
  }

  IconData checkIcon(PropertyActivity activity) {
    switch (activity.status) {
      case 'started':
        return Icons.play_circle_outline;

      case 'pending':
        return Icons.schedule_outlined;

      case 'failed':
        return Icons.cancel_outlined;

      case 'success':
        return Icons.check_circle_outline;

      default:
        return Icons.home_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(
                checkIcon(activity),
                color: checkColor(activity),
                size: width * 0.06,
              ),
              Container(
                height: width * 0.2,
                width: width * 0.002,
                color: checkColor(activity),
              ),
            ],
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomFont(
                        name: activity.title,
                        fontColor: colorScheme.onSurface,
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                      ),

                      const Spacer(),

                      CustomFont(
                        name: activity.date.toString(),
                        fontColor: colorScheme.onSurface.withValues(alpha: 0.6),
                        fontSize: width * 0.025,
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  Text(
                    activity.description,
                    style: TextStyle(
                      color: checkColor(activity),
                      fontFamily: fontFamily,
                      fontSize: width * 0.03,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
        return const Color.fromARGB(255, 49, 89, 123);
      case 'pending':
        return const Color.fromARGB(255, 159, 148, 53);
      case 'failed':
        return Colors.red;
      case 'success':
        return Colors.green;
      default:
        return secondaryColor;
    }
  }

  IconData checkIcon(PropertyActivity activity) {
    switch (activity.status) {
      case 'started':
        return Icons.play_arrow;
      case 'pending':
        return Icons.attach_money;
      case 'failed':
        return Icons.cancel;
      case 'success':
        return Icons.check_circle;
      default:
        return Icons.home;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                size: width * 0.07,
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
                        fontColor: blackColor,
                        fontSize: width * 0.05,
                      ),
                      Spacer(),
                      CustomFont(
                        name: activity.date.toString(),
                        fontColor: blackColor,
                        fontSize: width * 0.03,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    activity.description,
                    style: TextStyle(
                      color: greenColor,
                      fontFamily: fontFamily,
                      fontSize: width * 0.04,
                    ),
                  ),
                  // CustomFont(
                  //   name: activity.description,
                  //   fontColor: greenColor,
                  //   fontSize: width * 0.04,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

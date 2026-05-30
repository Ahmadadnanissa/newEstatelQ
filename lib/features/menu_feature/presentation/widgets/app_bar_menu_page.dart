import 'package:flutter/material.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';

class AppBarMenuPage extends StatelessWidget {
  const AppBarMenuPage({
    super.key,
    required this.image,
    required this.name,
    required this.email,
  });

  final String image;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(left: width * 0.24, top: width * 0.06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 50, backgroundImage: AssetImage(image)),

          SizedBox(height: width * 0.01),

          CustomFont(
            name: name,
            fontColor: colorScheme.onSurface,
            fontSize: width * 0.04,
            fontWeight: FontWeight.w600,
          ),

          SizedBox(height: width * 0.01),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.email_outlined,
                size: width * 0.04,
                color: colorScheme.primary,
              ),
              SizedBox(width: width * 0.01),
              CustomFont(
                name: email,
                fontColor: colorScheme.onSurface,
                fontSize: width * 0.04,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),

          SizedBox(height: width * 0.01),
        ],
      ),
    );
  }
}

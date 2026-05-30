import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:flutter/material.dart';

class CustomButtonInProfilePage extends StatelessWidget {
  const CustomButtonInProfilePage({
    super.key,
    required this.nameButton,
    required this.onTap,
    required this.icon,
  });

  final String nameButton;
  final void Function() onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.02),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: width * 0.14,
          width: width * 0.85,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(width * 0.01),
          ),
          child: Row(
            children: [
              icon,
              SizedBox(width: width * 0.04),

              CustomFont(
                name: nameButton,
                fontColor: Theme.of(context).colorScheme.onSurface,
                fontSize: width * 0.045,
              ),

              Spacer(),

              Icon(
                Icons.chevron_right,
                size: width * 0.14,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/app_image.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/like_button.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class TypeButtonReviewsWidget extends StatelessWidget {
  const TypeButtonReviewsWidget({
    super.key,
    required this.propertyType,
    required this.id,
  });

  final String propertyType;
  final String id;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color textColor = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: EdgeInsets.all(width * 0.03),

      child: Row(
        children: [
          // ================= TYPE =================
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppImage(
                path: 'assets/images/Building.png',
                width: width * 0.1,
                height: width * 0.1,
              ),

              SizedBox(height: width * 0.01),

              CustomFont(
                name: propertyType,
                fontColor: isDark ? darkSubtitleColor : Colors.grey,
                fontSize: width * 0.03,
              ),
            ],
          ),

          const Spacer(),

          // ================= DIVIDER =================
          Container(
            width: 1,
            height: width * 0.18,
            color: isDark
                ? darkSubtitleColor.withValues(alpha: 0.4)
                : Colors.grey.withValues(alpha: 0.5),
          ),

          const Spacer(),

          // ================= REVIEWS =================
          PropertyLikeButton(propertyId: id.toString()),
          const Spacer(),

          // ================= DIVIDER =================
          Container(
            width: 1,
            height: width * 0.18,
            color: isDark
                ? darkSubtitleColor.withValues(alpha: 0.4)
                : Colors.grey.withValues(alpha: 0.5),
          ),

          const Spacer(),

          // ================= BUTTON =================
          CustomButton(name: 'Book Now', pushing: () {}),
        ],
      ),
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/app_image.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class TypeButtonReviewsWidget extends StatelessWidget {
  const TypeButtonReviewsWidget({
    super.key,
    required this.propertyType,
    required this.reviewCount,
    required this.rating,
  });

  final String propertyType;
  final String reviewCount;
  final String rating;

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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.rate_review_outlined,
                    color: secondaryColor,
                    size: width * 0.055,
                  ),

                  SizedBox(width: width * 0.01),

                  CustomFont(
                    name: reviewCount,
                    fontColor: isDark ? darkSubtitleColor : Colors.grey,
                    fontSize: width * 0.035,
                  ),
                ],
              ),

              SizedBox(height: width * 0.01),

              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: width * 0.05,
                  ),
                ),
              ),

              SizedBox(height: width * 0.01),

              CustomFont(
                name: rating,
                fontColor: secondaryColor,
                fontSize: width * 0.04,
                fontWeight: FontWeight.w600,
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

          // ================= BUTTON =================
          CustomButton(name: 'Book Now', pushing: () {}),
        ],
      ),
    );
  }
}

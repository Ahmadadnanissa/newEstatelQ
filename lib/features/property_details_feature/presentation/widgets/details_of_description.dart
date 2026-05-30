import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/custom_image_for_description.dart';
import 'package:flutter/material.dart';

class DetailsOfDescription extends StatelessWidget {
  const DetailsOfDescription({
    super.key,
    required this.fullDescr,
    required this.images,
  });

  final String fullDescr;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color subtitleColor = isDark ? darkSubtitleColor : Colors.grey;

    final Color titleColor = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // ================= TITLE =================
          CustomFont(
            name: 'Description',
            fontColor: secondaryColor,
            fontSize: width * 0.06,
            fontWeight: FontWeight.w600,
          ),

          SizedBox(height: width * 0.02),

          // ================= DESCRIPTION =================
          Text(
            fullDescr,
            style: TextStyle(
              color: subtitleColor,
              fontSize: width * 0.04,
              fontFamily: fontFamily,
              height: 1.4,
            ),
          ),

          SizedBox(height: width * 0.04),

          // ================= IMAGES =================
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: images.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CustomImageForDescription(image: e),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

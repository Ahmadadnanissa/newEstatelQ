import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/app_image.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/provider/favorite_provider.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/list_of_more_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCardForProperty extends StatefulWidget {
  const CustomCardForProperty({
    super.key,
    required this.image,
    required this.title,
    required this.address,
    required this.price,
    required this.type,
    required this.numberOfRooms,
    required this.numberOfPath,
    required this.sqft,
    required this.id,
  });

  final String image;
  final String title;
  final String address;
  final String price;
  final String type;
  final int numberOfRooms;
  final int numberOfPath;
  final int sqft;
  final String id;

  @override
  State<CustomCardForProperty> createState() => _CustomCardForPropertyState();
}

class _CustomCardForPropertyState extends State<CustomCardForProperty> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final favoriteProvider = context.watch<FavoriteProvider>();

    bool isFavorite = favoriteProvider.isFavorite(widget.id);

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,

        borderRadius: BorderRadius.circular(width * 0.05),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.15 : 0.08),

            blurRadius: 12,

            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(width * .05),
                ),

                child: AppImage(
                  path: widget.image,
                  width: double.infinity,
                  height: width * .38,
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),

                child: Row(
                  children: [
                    Container(
                      height: width * .08,
                      width: width * .23,

                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,

                        borderRadius: BorderRadius.circular(width * .03),

                        border: Border.all(
                          color: secondaryColor.withValues(alpha: 0.25),
                        ),
                      ),

                      child: Center(
                        child: CustomFont(
                          name: widget.type,

                          fontColor: secondaryColor,

                          fontSize: width * .035,

                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const Spacer(),

                    Icon(
                      Icons.share_outlined,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: width * .08,
                    ),

                    GestureDetector(
                      onTap: () async {
                        await favoriteProvider.addToFavorite(widget.id);
                      },

                      child: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,

                        color: isFavorite
                            ? Colors.red
                            : Theme.of(
                                context,
                              ).colorScheme.onSurface.withValues(alpha: 0.6),

                        size: width * .08,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * .03,
              vertical: width * .03,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      CustomFont(
                        name: widget.title,

                        fontColor: secondaryColor,

                        fontSize: width * .05,

                        fontWeight: FontWeight.bold,
                      ),

                      SizedBox(height: width * .01),

                      CustomFont(
                        name: widget.address,

                        fontColor: isDark ? darkSubtitleColor : Colors.grey,

                        fontSize: width * .035,
                      ),
                    ],
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    CustomFont(
                      name: widget.price,

                      fontColor: secondaryColor,

                      fontSize: width * .05,

                      fontWeight: FontWeight.bold,
                    ),

                    CustomFont(
                      name: "For Sale",

                      fontColor: isDark ? darkSubtitleColor : Colors.grey,

                      fontSize: width * .035,
                    ),
                  ],
                ),
              ],
            ),
          ),

          ListOfMoreDetails(
            numberOfPath: widget.numberOfPath,

            numberOfRoom: widget.numberOfRooms,

            sqft: widget.sqft,
          ),

          SizedBox(height: width * .03),
        ],
      ),
    );
  }
}

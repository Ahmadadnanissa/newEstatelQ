import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/property_details_feature/data/models/property_model.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/room_details_widget.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/details_of_description.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/property_image.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/sum_details_for_property_like_title.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/type_button_reviews_widget.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/location_widget.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/outdoor_widget.dart';
import 'package:flutter/material.dart';

class BasePropertyDetailsWidget extends StatelessWidget {
  final PropertyModel property;

  const BasePropertyDetailsWidget({super.key, required this.property});

  String getGalleryImage(int index) {
    if (property.galleryPhoto.length > index) {
      return property.galleryPhoto[index];
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color subtitleColor = isDark ? darkSubtitleColor : Colors.grey;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PropertyImage(
          primaryImage:
              // property.primaryPhoto ??
              "assets/images/apartment.jpg",
        ),

        SumDetailsForPropertyLikeTitle(
          subDescription: property.shortDescription,
          address: property.location,
          rentOrSale: property.listingType,
          price: property.askingPrice,
        ),

        TypeButtonReviewsWidget(
          propertyType: property.propertyType,
          id: property.requestId,
        ),

        DetailsOfDescription(
          fullDescr: property.fullDescription,
          images: [
            "assets/images/jesse-collins-LUitWpwc008-unsplash.jpg",
            "assets/images/ahmed-rangel-QAzk_ceFf-w-unsplash.jpg",
            "assets/images/clay-banks-79yk4XalXCM-unsplash.jpg",
            "assets/images/uday-vatti-8YC9T7W-lE4-unsplash.jpg",
          ],
          // property.galleryPhoto,
        ),

        SizedBox(height: width * .04),

        Divider(color: subtitleColor),

        RoomDetailsWidget(rooms: property.roomItems),

        Divider(color: subtitleColor),

        OutdoorWidget(outdoorItems: property.outDoors),

        Divider(color: subtitleColor),

        LocationWidget(property: property),
      ],
    );
  }
}

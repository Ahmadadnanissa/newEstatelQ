import 'package:estatelqapp/features/property_details_feature/data/models/property_model.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/bed_and_bath_and_sqft.dart';
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
    if (property.galleryPhotos.length > index) {
      return property.galleryPhotos[index];
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PropertyImage(primaryImage: property.primaryPhoto),

        SumDetailsForPropertyLikeTitle(
          subDescription: property.simpleDescription ?? "",

          address: property.location,

          rentOrSale: property.listingType,

          price: property.listedPrice.toString(),
        ),

        TypeButtonReviewsWidget(
          propertyType: property.type,

          reviewCount: "0",

          rating: "0",
        ),

        DetailsOfDescription(
          fullDescr: property.fullDescription ?? "",

          image1: getGalleryImage(0),
          image2: getGalleryImage(1),
          image3: getGalleryImage(2),
          image4: getGalleryImage(3),
        ),

        SizedBox(height: width * .04),

        Divider(),

        BedAndBathAndSqft(rooms: property.rooms),

        Divider(),

        OutdoorWidget(outdoorItems: property.outdoorItems),

        Divider(),

        LocationWidget(property: property),
      ],
    );
  }
}

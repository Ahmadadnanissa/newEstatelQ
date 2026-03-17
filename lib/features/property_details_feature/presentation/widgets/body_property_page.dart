import 'package:estatelqapp/features/property_details_feature/presentation/widgets/bed_and_bath_and_sqft.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/details_of_description.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/property_image.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/sum_details_for_property_like_title.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/type_button_reviews_widget.dart';
import 'package:flutter/material.dart';

class BodyPropertyPage extends StatelessWidget {
  const BodyPropertyPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PropertyImage(),
          SumDetailsForPropertyLikeTitle(),
          TypeButtonReviewsWidget(),
          DetailsOfDescription(),
          SizedBox(height: width * 0.06),
          BedAndBathAndSqft(),
          SizedBox(height: width * 0.04),

          SizedBox(height: width * 0.04),
        ],
      ),
    );
  }
}

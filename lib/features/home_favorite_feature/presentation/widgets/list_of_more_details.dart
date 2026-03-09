import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/more_details_for_property_card.dart';
import 'package:flutter/material.dart';

class ListOfMoreDetails extends StatelessWidget {
  const ListOfMoreDetails({
    super.key,
    required this.numberOfPath,
    required this.numberOfRoom,
    required this.sqft,
  });
  final int numberOfPath;
  final int numberOfRoom;
  final int sqft;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MoreDetailsForPropertyCard(
          icon: Icon(Icons.bed, size: width * 0.05, color: blackColor),
          type: ' $numberOfRoom Rooms',
        ),

        MoreDetailsForPropertyCard(
          icon: Icon(
            Icons.square_outlined,
            size: width * 0.05,
            color: blackColor,
          ),
          type: ' $sqft sqft',
        ),

        MoreDetailsForPropertyCard(
          icon: Icon(Icons.bathtub, size: width * 0.05, color: blackColor),
          type: ' $numberOfPath Path',
        ),
      ],
    );
  }
}

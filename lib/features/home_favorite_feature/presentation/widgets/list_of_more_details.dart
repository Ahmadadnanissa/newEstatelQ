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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MoreDetailsForPropertyCard(
          icon: Icon(
            Icons.bed_outlined,
            size: width * 0.05,
            color: colorScheme.primary,
          ),
          type: '$numberOfRoom Rooms',
        ),

        MoreDetailsForPropertyCard(
          icon: Icon(
            Icons.square_foot_outlined,
            size: width * 0.05,
            color: colorScheme.primary,
          ),
          type: '$sqft sqft',
        ),

        MoreDetailsForPropertyCard(
          icon: Icon(
            Icons.bathtub_outlined,
            size: width * 0.05,
            color: colorScheme.primary,
          ),
          type: '$numberOfPath Bath',
        ),
      ],
    );
  }
}

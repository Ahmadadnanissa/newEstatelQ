import 'package:flutter/material.dart';
import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/provider/home_provider.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/type_of_property.dart';
import 'package:provider/provider.dart';

class RowForTypeOfProperty extends StatefulWidget {
  const RowForTypeOfProperty({super.key});

  @override
  State<RowForTypeOfProperty> createState() => _RowForTypeOfPropertyState();
}

class _RowForTypeOfPropertyState extends State<RowForTypeOfProperty> {
  String selectedType = 'All';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget item({
      required String type,
      required IconData icon,
      required Color bg,
    }) {
      return TypeOfProperty(
        icon: icon,
        type: type,
        backgroundColor: bg,
        isSelected: selectedType == type,
        onTap: () {
          setState(() => selectedType = type);
          context.read<HomeProvider>().setType(type);
        },
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            item(
              type: 'All',
              icon: Icons.public_rounded,
              bg: colorScheme.surface,
            ),

            item(
              type: 'Apartment',
              icon: Icons.apartment_rounded,
              bg: colorScheme.surface,
            ),

            item(
              type: 'Villa',
              icon: Icons.villa_rounded,
              bg: colorScheme.surface,
            ),

            item(
              type: 'House',
              icon: Icons.home_rounded,
              bg: colorScheme.surface,
            ),

            item(
              type: 'Store',
              icon: Icons.storefront_rounded,
              bg: colorScheme.surface,
            ),

            item(
              type: 'office',
              icon: Icons.business_rounded,
              bg: colorScheme.surface,
            ),
          ],
        ),
      ),
    );
  }
}

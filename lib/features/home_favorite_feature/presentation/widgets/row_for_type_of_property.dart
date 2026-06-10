import 'package:flutter/material.dart';
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
      required String label,
      required String value,
      required IconData icon,
      required Color bg,
    }) {
      return TypeOfProperty(
        icon: icon,
        type: label,
        backgroundColor: bg,
        isSelected: selectedType == value,
        onTap: () {
          setState(() => selectedType = value);

          context.read<HomeProvider>().setType(value);
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
              label: 'All',
              value: 'All',
              icon: Icons.public_rounded,
              bg: colorScheme.surface,
            ),

            item(
              label: 'Apartment',
              value: 'APARTMENT',
              icon: Icons.apartment_rounded,
              bg: colorScheme.surface,
            ),

            item(
              label: 'Villa',
              value: 'VILLA',
              icon: Icons.villa_rounded,
              bg: colorScheme.surface,
            ),

            item(
              label: 'House',
              value: 'HOUSE',
              icon: Icons.home_rounded,
              bg: colorScheme.surface,
            ),

            item(
              label: 'Store',
              value: 'STORE',
              icon: Icons.storefront_rounded,
              bg: colorScheme.surface,
            ),

            item(
              label: 'Office',
              value: 'OFFICE',
              icon: Icons.business_rounded,
              bg: colorScheme.surface,
            ),
          ],
        ),
      ),
    );
  }
}

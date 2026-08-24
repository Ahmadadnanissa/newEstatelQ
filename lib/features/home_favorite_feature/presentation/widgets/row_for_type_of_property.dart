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
      required VoidCallback onTap,
    }) {
      return TypeOfProperty(
        icon: icon,
        type: label,
        backgroundColor: bg,
        isSelected: selectedType == value,
        onTap: () {
          setState(() => selectedType = value);
          onTap();
        },
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            // =========================
            // ALL
            // =========================
            item(
              label: 'All',
              value: 'All',
              icon: Icons.public_rounded,
              bg: colorScheme.surface,
              onTap: () {
                context.read<HomeProvider>().setType('All');
                context.read<HomeProvider>().setPropertyTopic('All');
              },
            ),

            // =========================
            // TOPICS
            // =========================
            item(
              label: 'Trendy',
              value: 'Trendy',
              icon: Icons.trending_up_rounded,
              bg: colorScheme.surface,
              onTap: () {
                context.read<HomeProvider>().setPropertyTopic('Trendy');
              },
            ),

            item(
              label: 'For You',
              value: 'For You',
              icon: Icons.recommend_rounded,
              bg: colorScheme.surface,
              onTap: () {
                context.read<HomeProvider>().setPropertyTopic('For You');
              },
            ),

            item(
              label: 'Collaborative',
              value: 'Collaborative',
              icon: Icons.people_alt_rounded,
              bg: colorScheme.surface,
              onTap: () {
                context.read<HomeProvider>().setPropertyTopic('Collaborative');
              },
            ),

            // =========================
            // PROPERTY TYPES
            // =========================
            item(
              label: 'Apartment',
              value: 'APARTMENT',
              icon: Icons.apartment_rounded,
              bg: colorScheme.surface,
              onTap: () {
                context.read<HomeProvider>().setType('APARTMENT');
              },
            ),

            item(
              label: 'Villa',
              value: 'VILLA',
              icon: Icons.villa_rounded,
              bg: colorScheme.surface,
              onTap: () {
                context.read<HomeProvider>().setType('VILLA');
              },
            ),

            item(
              label: 'House',
              value: 'HOUSE',
              icon: Icons.home_rounded,
              bg: colorScheme.surface,
              onTap: () {
                context.read<HomeProvider>().setType('HOUSE');
              },
            ),

            item(
              label: 'Store',
              value: 'STORE',
              icon: Icons.storefront_rounded,
              bg: colorScheme.surface,
              onTap: () {
                context.read<HomeProvider>().setType('STORE');
              },
            ),

            item(
              label: 'Office',
              value: 'OFFICE',
              icon: Icons.business_rounded,
              bg: colorScheme.surface,
              onTap: () {
                context.read<HomeProvider>().setType('OFFICE');
              },
            ),
          ],
        ),
      ),
    );
  }
}

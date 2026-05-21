import 'package:estatelqapp/features/property_details_feature/data/models/appartment_model.dart';

import 'package:estatelqapp/features/property_details_feature/presentation/providers/property_details_provider.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/widgets/apartment_details_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyPropertyPage extends StatefulWidget {
  BodyPropertyPage({super.key, required this.propertyId});
  final String propertyId;

  @override
  State<BodyPropertyPage> createState() => _BodyPropertyPageState();
}

class _BodyPropertyPageState extends State<BodyPropertyPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<PropertyDetailsProvider>().getPropertyById(
        widget.propertyId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Consumer<PropertyDetailsProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.error != null) {
          return Center(child: Text(provider.error!));
        }

        if (provider.property == null) {
          return const Center(child: Text("No Data"));
        }

        final property = provider.property!;

        if (property is ApartmentModel) {
          return ApartmentDetailsWidget(property: property);
        }

        // if (property is VillaModel) {
        //   return VillaDetailsWidget(property: property);
        // }

        // if (property is HouseModel) {
        //   return HouseDetailsWidget(property: property);
        // }

        // if (property is HallModel) {
        //   return HallDetailsWidget(property: property);
        // }

        // if (property is StoreModel) {
        //   return StoreDetailsWidget(property: property);
        // }

        return SizedBox();
      },
    );
  }
}

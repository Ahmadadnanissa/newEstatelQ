import 'dart:convert';
import 'dart:io';

import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/custom_message.dart';

import 'package:estatelqapp/features/menu_feature/data/models/request_model.dart';

import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/request_provider.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class BodyListYourPropertyPage extends StatefulWidget {
  const BodyListYourPropertyPage({super.key});

  @override
  State<BodyListYourPropertyPage> createState() =>
      _BodyListYourPropertyPageState();
}

class _BodyListYourPropertyPageState extends State<BodyListYourPropertyPage> {
  String propertyTitle = '';

  double lat = 0;
  double lng = 0;

  double price = 0;
  double totalArea = 0;

  int numberOfRooms = 0;
  int numberOfBathrooms = 0;

  String locationProperty = '';

  String propertyType = 'Apartments';

  String propertyStatus = 'For Sale';

  bool isParking = true;
  bool isSwimmingPool = true;
  bool isFurnished = true;
  bool isHeating = true;

  final _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();

  List<File> selectedImages = [];

  Future<void> pickImages() async {
    final images = await _picker.pickMultiImage();

    if (images != null) {
      if (images.length > 5) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You can select up to 5 images only')),
        );

        return;
      }

      setState(() {
        selectedImages = images.map((img) => File(img.path)).toList();
      });
    }
  }

  Future<String> convertImageToBase64(File image) async {
    List<int> imageBytes = await image.readAsBytes();

    return base64Encode(imageBytes);
  }

  Future<List<String>> convertImagesToBase64List() async {
    List<String> base64Images = [];

    for (var img in selectedImages) {
      base64Images.add(await convertImageToBase64(img));
    }

    return base64Images;
  }

  Future<RequestModel> buildRequest() async {
    return RequestModel(
      title: propertyTitle,

      price: price,

      area: totalArea,

      rooms: numberOfRooms,

      bathrooms: numberOfBathrooms,

      location: locationProperty,

      type: propertyType,

      status: propertyStatus,

      parking: isParking,

      swimmingPool: isSwimmingPool,

      furnished: isFurnished,

      heating: isHeating,

      lat: lat,

      lng: lng,

      images: await convertImagesToBase64List(),
    );
  }

  void clearForm() {
    propertyTitle = '';

    lat = 0;
    lng = 0;

    price = 0;

    totalArea = 0;

    numberOfRooms = 0;

    numberOfBathrooms = 0;

    locationProperty = '';

    selectedImages = [];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final provider = context.watch<RequestProvider>();

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.04),

          child: Form(
            key: _formKey,

            child: Column(
              children: [
                PrimaryButton(
                  name: provider.isLoading ? "Loading..." : "Send for Review",

                  pushing: () async {
                    if (provider.isLoading) return;

                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    if (selectedImages.isEmpty) {
                      CustomMessage.error(context, "Please upload images");

                      return;
                    }

                    if (lat == 0 && lng == 0) {
                      CustomMessage.error(context, "Please select location");

                      return;
                    }

                    final request = await buildRequest();

                    await provider.sendRequest(
                      request: request,

                      context: context,
                    );

                    clearForm();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

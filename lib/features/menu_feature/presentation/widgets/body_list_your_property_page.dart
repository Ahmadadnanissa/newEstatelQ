import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:estatelqapp/features/menu_feature/data/models/request_model.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/map_page_for_request_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/request_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/custom_text_form_field_for_string.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/custom_text_in_list_your_property.dart';
import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/custom_message.dart';
import 'package:estatelqapp/core/widgets/select_request_type.dart';

class BodyListYourPropertyPage extends StatefulWidget {
  const BodyListYourPropertyPage({super.key});

  @override
  State<BodyListYourPropertyPage> createState() =>
      _BodyListYourPropertyPageState();
}

class _BodyListYourPropertyPageState extends State<BodyListYourPropertyPage> {
  String propertyTitle = '';
  String propertyStatus = 'For Sale';
  double lat = 0.0;
  double lng = 0.0;
  double price = 0;
  double totalArea = 0;
  int numberOfRooms = 0;
  int numberOfBathrooms = 0;
  String locationProperty = '';
  String propertyType = 'Apartment';

  bool isParking = true;
  bool isSwimmingPool = true;
  bool isFurnished = true;
  bool isHeating = true;

  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  List<File> selectedImages = [];

  Future<void> pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();

    if (images == null) return;

    if (images.length > 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You can select up to 5 images only')),
      );
      return;
    }

    setState(() {
      selectedImages = images.map((img) => File(img.path)).toList();
    });
  }

  Future<String> convertImageToBase64(File image) async {
    return base64Encode(await image.readAsBytes());
  }

  Future<List<String>> convertImagesToBase64List() async {
    return Future.wait(selectedImages.map((img) => convertImageToBase64(img)));
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
      parking: isParking,
      swimmingPool: isSwimmingPool,
      furnished: isFurnished,
      heating: isHeating,
      lat: lat,
      lng: lng,
      images: ['hfalidhvdfv'],
      // images: await convertImagesToBase64List(),
    );
  }

  String getRequestType() {
    return propertyStatus == "For Sale" ? "SELL" : "RENT";
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final provider = context.watch<RequestProvider>();

    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextInListYourProperty(name: 'Add Property'),
                SizedBox(height: width * 0.02),

                CustomTextFormFieldForString(
                  icon: Icon(Icons.home_outlined, color: colorScheme.primary),
                  hintText: 'Property Title',
                  onChanged: (data) => propertyTitle = data.trim(),
                  validator: (data) =>
                      data!.isEmpty ? 'this field required' : null,
                ),

                SizedBox(height: width * 0.06),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextInListYourProperty(name: 'Property Type'),
                        SelectRequestType(
                          requestTypes: [
                            "Apartment",
                            "Villa",
                            "Office",
                            "House",
                            "Hall",
                          ],
                          hintText: 'Apartment',
                          selectedValue: propertyType,
                          onChanged: (value) {
                            setState(() => propertyType = value);
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextInListYourProperty(name: 'Property Status'),
                        SelectRequestType(
                          requestTypes: ["For Sale", "For Rent"],
                          hintText: 'For Sale',
                          selectedValue: propertyStatus,
                          onChanged: (value) {
                            setState(() => propertyStatus = value);
                          },
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: width * 0.04),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextInListYourProperty(name: 'Price'),
                        CustomTextFormFieldForString(
                          icon: Icon(
                            Icons.attach_money,
                            color: colorScheme.primary,
                          ),
                          hintText: 'Enter Price',
                          onChanged: (data) =>
                              price = double.tryParse(data) ?? 0,
                          validator: (data) =>
                              data!.isEmpty ? 'this field required' : null,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextInListYourProperty(name: 'Area'),
                        CustomTextFormFieldForString(
                          icon: Icon(
                            Icons.square_foot_outlined,
                            color: colorScheme.primary,
                          ),
                          hintText: 'Enter Total Area',
                          onChanged: (data) =>
                              totalArea = double.tryParse(data) ?? 0,
                          validator: (data) =>
                              data!.isEmpty ? 'this field required' : null,
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: width * 0.04),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextInListYourProperty(name: 'Rooms'),
                        CustomTextFormFieldForString(
                          icon: Icon(
                            Icons.bed_outlined,
                            color: colorScheme.primary,
                          ),
                          hintText: 'Rooms',
                          onChanged: (data) =>
                              numberOfRooms = int.tryParse(data) ?? 0,
                          validator: (data) =>
                              data!.isEmpty ? 'this field required' : null,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextInListYourProperty(name: 'Bathrooms'),
                        CustomTextFormFieldForString(
                          icon: Icon(
                            Icons.bathroom_outlined,
                            color: colorScheme.primary,
                          ),
                          hintText: 'Bathrooms',
                          onChanged: (data) =>
                              numberOfBathrooms = int.tryParse(data) ?? 0,
                          validator: (data) =>
                              data!.isEmpty ? 'this field required' : null,
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: width * 0.04),

                GestureDetector(
                  onTap: pickImages,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '+ Upload Images (max 5)',
                      style: TextStyle(color: colorScheme.onSurface),
                    ),
                  ),
                ),

                Wrap(
                  spacing: 10,
                  children: selectedImages
                      .map(
                        (image) => Image.file(
                          image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      )
                      .toList(),
                ),

                Divider(color: colorScheme.outline),

                CustomTextInListYourProperty(name: 'Select Location'),

                GestureDetector(
                  onTap: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      MapPageForRequestPage.id,
                    );

                    if (result is Map<String, dynamic>) {
                      setState(() {
                        lat = result["lat"] ?? 0;
                        lng = result["lng"] ?? 0;
                        locationProperty = result["address"] ?? '';
                      });
                    }
                  },
                  child: Image.asset(
                    'assets/images/map_Image.png',
                    width: width * 0.35,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: width * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      name: provider.isLoading
                          ? "Loading..."
                          : "Send for Review",
                      pushing: () async {
                        if (provider.isLoading) return;

                        if (!_formKey.currentState!.validate()) return;

                        // if (selectedImages.isEmpty) {
                        //   CustomMessage.error(context, "Please upload images");
                        //   return;
                        // }

                        if (lat == 0 || lng == 0) {
                          CustomMessage.error(
                            context,
                            "Please select location",
                          );
                          return;
                        }

                        final request = await buildRequest();

                        await provider.sendRequest(
                          request: request,
                          type: getRequestType(),
                          context: context,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/core/widgets/select_request_type.dart';
import 'package:estatelqapp/features/menu_feature/data/models/request_model.dart';
import 'package:estatelqapp/features/menu_feature/presentation/pages/map_page_for_request_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/custom_text_form_field_for_string.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/custom_text_in_list_your_property.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BodyListYourPropertyPage extends StatefulWidget {
  const BodyListYourPropertyPage({super.key});

  @override
  State<BodyListYourPropertyPage> createState() =>
      _BodyListYourPropertyPageState();
}

class _BodyListYourPropertyPageState extends State<BodyListYourPropertyPage> {
  String propertyTitle = '';
  double lat = 0.0;
  double lng = 0.0;
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
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final List<XFile>? images = await _picker.pickMultiImage();

    if (images != null) {
      if (images.length > 5) {
        // ignore: use_build_context_synchronously
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                  icon: Icon(Icons.home, color: secondaryColor),
                  hintText: 'Property Title',
                  onChanged: (data) {
                    propertyTitle = data.trim();
                  },
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'this field required';
                    }
                    return null;
                  },
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
                            "Apartments",
                            "Villa",
                            "office",
                            "House",
                            "Hall",
                          ],
                          hintText: 'Appartment',

                          onChanged: (value) {
                            setState(() {
                              propertyType = value;
                            });
                          },
                          selectedValue: propertyType,
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextInListYourProperty(name: 'Property Status'),
                        SelectRequestType(
                          requestTypes: ["For Sale", "For Rent"],
                          hintText: 'For Sale',
                          selectedValue: propertyStatus,
                          onChanged: (String p1) {
                            propertyStatus = p1;
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
                          icon: Icon(Icons.price_check, color: secondaryColor),
                          hintText: 'Enter Price',
                          onChanged: (data) {
                            price = double.tryParse(data) ?? 0;
                          },
                          validator: (data) {
                            if (data!.isEmpty) {
                              return 'this field required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextInListYourProperty(name: 'Area(m*m)'),
                        CustomTextFormFieldForString(
                          icon: Icon(
                            Icons.area_chart_outlined,
                            color: secondaryColor,
                          ),
                          hintText: 'Enter Total Area',
                          onChanged: (data) {
                            totalArea = double.tryParse(data) ?? 0;
                          },
                          validator: (data) {
                            if (data!.isEmpty) {
                              return 'this field required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: width * 0.04),

                SizedBox(height: width * 0.04),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextInListYourProperty(name: 'Rooms'),
                        CustomTextFormFieldForString(
                          icon: Icon(Icons.bed, color: secondaryColor),
                          hintText: 'Number of rooms',
                          onChanged: (data) {
                            numberOfRooms = int.tryParse(data) ?? 0;
                          },
                          validator: (data) {
                            if (data!.isEmpty) {
                              return 'this field required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextInListYourProperty(name: 'Bathrooms'),
                        CustomTextFormFieldForString(
                          icon: Icon(Icons.bathroom, color: secondaryColor),
                          hintText: 'Number of bathrooms',
                          onChanged: (data) {
                            numberOfBathrooms = int.tryParse(data) ?? 0;
                          },
                          validator: (data) {
                            if (data!.isEmpty) {
                              return 'this field required';
                            }
                            return null;
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
                        CustomTextInListYourProperty(name: 'Parking'),
                        SelectRequestType(
                          requestTypes: ["Available", "Unavailable"],
                          hintText: 'Available',
                          selectedValue: isParking
                              ? "Available"
                              : "Unavailable",
                          onChanged: (value) {
                            setState(() {
                              isParking = value == "Available";
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextInListYourProperty(name: 'Heating'),
                        SelectRequestType(
                          requestTypes: ["Available", "UnAvailable"],
                          hintText: 'Available',
                          selectedValue: isHeating
                              ? "Available"
                              : "Unavailable",
                          onChanged: (value) {
                            setState(() {
                              isHeating = value == "Available";
                            });
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
                        CustomTextInListYourProperty(name: 'Furnishing'),
                        SelectRequestType(
                          requestTypes: ['Fully Furnished', 'Not Furnished'],
                          hintText: 'Fully Furnished',
                          selectedValue: isFurnished
                              ? "Fully Furnished"
                              : "Not Furnished",
                          onChanged: (value) {
                            setState(() {
                              isFurnished = value == "Fully Furnished";
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextInListYourProperty(name: 'Swimming Pool'),
                        SelectRequestType(
                          requestTypes: ["Available", "UnAvailable"],
                          hintText: 'Available',
                          selectedValue: isSwimmingPool
                              ? "Available"
                              : "UnAvailable",
                          onChanged: (value) {
                            setState(() {
                              isSwimmingPool = value == "Available";
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: width * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: pickImages,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              offset: Offset(0, 3),
                              blurRadius: 10,
                            ),
                          ],
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),

                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomFont(
                            name: '+ Upload Images (upto 5)',
                            fontColor: blackColor,
                            fontSize: width * 0.04,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    Wrap(
                      spacing: 10,
                      children: selectedImages.map((image) {
                        return Image.file(
                          image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: width * 0.04),
                Divider(height: 2, color: grayColor),

                SizedBox(height: width * 0.02),
                CustomTextInListYourProperty(
                  name: 'Enter your property location',
                ),
                GestureDetector(
                  onTap: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      MapPageForRequestPage.id,
                    );

                    if (result != null) {
                      final data = result as Map<String, dynamic>;
                      setState(() {
                        lat = data["lat"];
                        lng = data["lng"];
                        locationProperty = data["address"];
                      });
                    }
                  },
                  child: Container(
                    width: width * 0.3,
                    height: width * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.02),
                    ),
                    child: Image.asset('assets/images/map_Image.png'),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      name: 'Send for Review',
                      pushing: () async {
                        if (_formKey.currentState!.validate()) {
                          final request = await buildRequest();

                          // ignore: avoid_print
                          print(request.toJson());

                          // await ApiService.sendRequest(request.toJson());
                        }
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

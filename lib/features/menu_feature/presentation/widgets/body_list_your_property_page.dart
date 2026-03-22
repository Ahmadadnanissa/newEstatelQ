import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/core/widgets/select_request_type.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/custom_text_form_field_for_string.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/custom_text_in_list_your_property.dart';
import 'package:flutter/material.dart';

class BodyListYourPropertyPage extends StatefulWidget {
  const BodyListYourPropertyPage({super.key});

  @override
  State<BodyListYourPropertyPage> createState() =>
      _BodyListYourPropertyPageState();
}

class _BodyListYourPropertyPageState extends State<BodyListYourPropertyPage> {
  String? propertyTitle;
  String? price;
  String? totalArea;
  String? numberOfRooms;
  String? numberOfPathRooms;
  String? locationProperty;
  String propertyTtpe = 'Appartment';
  String isParking = 'Available';
  String isSwimmingPool = 'Available';
  String isFurnished = 'Fully Furnished';
  String isHeating = 'Available';
  String propertyStatus = 'For Sale';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(width * 0.04),
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
                      requestTypes: ["Apartments", "Villa", "office", "House"],
                      hintText: 'Appartment',
                      selectedRequest: propertyTtpe,
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
                      selectedRequest: propertyStatus,
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
                        price = data.trim();
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
                        totalArea = data.trim();
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextInListYourProperty(name: 'Location Details'),
                    CustomTextFormFieldForString(
                      icon: Icon(
                        Icons.location_on_sharp,
                        color: secondaryColor,
                      ),
                      hintText: 'City',
                      onChanged: (data) {
                        locationProperty = data.trim();
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
                SizedBox(width: width * 0.02),
                Container(
                  width: width * 0.4,
                  height: width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.02),
                  ),
                  child: Image.asset('assets/images/map_Image.png'),
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
                      icon: Icon(Icons.bed, color: secondaryColor),
                      hintText: 'Number of rooms',
                      onChanged: (data) {
                        numberOfRooms = data.trim();
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
                        numberOfPathRooms = data.trim();
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
                      requestTypes: ['Available', 'UnAvailable'],
                      hintText: 'Available',
                      selectedRequest: isParking,
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
                      selectedRequest: isHeating,
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
                      selectedRequest: isFurnished,
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
                      selectedRequest: isSwimmingPool,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: width * 0.04),
            Container(
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

            SizedBox(height: width * 0.04),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(name: 'Send for Review', pushing: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

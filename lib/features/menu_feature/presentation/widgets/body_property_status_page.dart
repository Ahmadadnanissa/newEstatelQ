import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/app_image.dart';
import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/list_of_more_details.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/row_for_see_activity_in_property_status.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/title_and_type_for_property_status.dart';

import 'package:flutter/material.dart';

class BodyPropertyStatusPage extends StatefulWidget {
  const BodyPropertyStatusPage({super.key});

  @override
  State<BodyPropertyStatusPage> createState() => _BodyPropertyStatusPageState();
}

class _BodyPropertyStatusPageState extends State<BodyPropertyStatusPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        AppImage(
          path: 'assets/images/jesse-collins-LUitWpwc008-unsplash.jpg',
          width: width,
          height: height * 0.55,
          fit: BoxFit.cover,
        ),

        TitleAndTypeForPropertyStatus(
          title: 'Mountain View Villa',
          type: 'Villa',
          price: '120.00',
          forWhat: 'For Sale',
        ),

        ListOfMoreDetails(numberOfPath: 4, numberOfRoom: 5, sqft: 300),
        SizedBox(height: width * 0.05),
        RowForSeeActivityInPropertyStatus(
          onTapRecentActivities: () {},
          onTapViewAll: () {},
        ),
        SizedBox(height: width * 0.08),

        ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Row(
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: secondaryColor,
                        size: width * 0.07,
                      ),
                      Container(
                        height: width * 0.2,
                        width: width * 0.002,
                        color: secondaryColor,
                      ),
                    ],
                  ),

                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomFont(
                              name: 'Titlte',
                              fontColor: blackColor,
                              fontSize: width * 0.05,
                            ),
                            Spacer(),
                            CustomFont(
                              name: 'date',
                              fontColor: blackColor,
                              fontSize: width * 0.03,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),

                        CustomFont(
                          name:
                              ' SubTitl SubTitle SubTitleSubTitle SubTitlee SubTitle',
                          fontColor: greenColor,
                          fontSize: width * 0.04,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/app_image.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/list_of_more_details.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/property_status_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/custom_card_for_status_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/row_for_see_activity_in_property_status.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/title_and_type_for_property_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyPropertyStatusPage extends StatefulWidget {
  const BodyPropertyStatusPage({super.key});

  @override
  State<BodyPropertyStatusPage> createState() => _BodyPropertyStatusPageState();
}

class _BodyPropertyStatusPageState extends State<BodyPropertyStatusPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<PropertyStatusProvider>().getActivities("1");
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PropertyStatusProvider>();

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

        if (provider.isLoading)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: CircularProgressIndicator(),
            ),
          )
        else if (provider.error != null)
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.08,
                vertical: width * 0.05,
              ),
              child: Text(
                'Something went wrong. Please try again later.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? darkSubtitleColor
                      : Colors.grey.shade600,
                  fontSize: width * 0.04,
                  fontFamily: fontFamily,
                ),
              ),
            ),
          )
        else if (provider.activities.isEmpty)
          Center(
            child: Padding(
              padding: EdgeInsets.all(width * 0.05),
              child: Text(
                'No activities found',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? darkSubtitleColor
                      : Colors.grey.shade600,
                  fontSize: width * 0.04,
                  fontFamily: fontFamily,
                ),
              ),
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: provider.activities.length,
            itemBuilder: (context, index) {
              final activity = provider.activities[index];

              return CustomCardForStatusPage(activity: activity);
            },
          ),

        SizedBox(height: width * 0.05),
      ],
    );
  }
}

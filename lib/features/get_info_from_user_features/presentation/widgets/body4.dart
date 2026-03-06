import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/secondary_button.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/check_number_of_room.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/sub_title_page.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/widgets/title_page.dart';
import 'package:flutter/material.dart';

class Body4 extends StatefulWidget {
  const Body4({super.key});

  @override
  State<Body4> createState() => _Body4State();
}

class _Body4State extends State<Body4> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitlePage(title: 'How many beds?'),

          SubTitlePage(
            subTitle:
                'this is just to get you started.you can change this later.',
          ),
          CheckNumberOfRoom(),

          SizedBox(height: width + width * 0.05),

          PrimaryButton(name: 'Next', pushing: () {}),

          SizedBox(height: width * 0.04),

          SecondaryButton(name: 'Skip', pushing: () {}),
        ],
      ),
    );
  }
}

import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/get_info_from_user_features/presentation/pages/getinfo_from_user1.dart';
import 'package:flutter/material.dart';

class GetStartButton extends StatefulWidget {
  const GetStartButton({super.key});

  @override
  State<GetStartButton> createState() => _GetStartButtonState();
}

class _GetStartButtonState extends State<GetStartButton> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.05, top: width * 0.14),
      child: PrimaryButton(
        name: 'Get Start',
        pushing: () {
          Navigator.push(context, SlideRight(page: GetinfoFromUser1()));
        },
      ),
    );
  }
}

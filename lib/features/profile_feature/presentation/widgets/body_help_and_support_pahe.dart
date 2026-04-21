import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/form_field_for_describe_issue.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/how_we_can_help_you_text.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/image_help_and_support_page.dart';
import 'package:estatelqapp/core/widgets/select_request_type.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/selected_request_type_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BodyHelpAndSupportPahe extends StatelessWidget {
  BodyHelpAndSupportPahe({super.key});
  String selectType = 'Complaint';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageHelpAndSupportPage(),
          SizedBox(height: width * 0.01),
          HowWeCanHelpYouText(),

          SelectedRequestTypeText(),
          SelectRequestType(
            requestTypes: ["Complaint", "Report Property", "General Inquiry"],
            hintText: 'Select Request Type',
            selectedValue: selectType,
            onChanged: (String p1) {
              selectType = p1;
            },
          ),

          FormFieldForDescribeIssue(),

          SizedBox(height: width * 0.06),

          PrimaryButton(name: 'Submit Request', pushing: () {}),
          SizedBox(height: width * 0.04),
        ],
      ),
    );
  }
}

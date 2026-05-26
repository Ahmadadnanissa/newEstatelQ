import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/select_request_type.dart';
import 'package:estatelqapp/features/profile_feature/presentation/providers/support_provider.dart';

import 'package:estatelqapp/features/profile_feature/presentation/widgets/form_field_for_describe_issue.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/how_we_can_help_you_text.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/image_help_and_support_page.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/selected_request_type_text.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyHelpAndSupportPahe extends StatefulWidget {
  const BodyHelpAndSupportPahe({super.key});

  @override
  State<BodyHelpAndSupportPahe> createState() => _BodyHelpAndSupportPaheState();
}

class _BodyHelpAndSupportPaheState extends State<BodyHelpAndSupportPahe> {
  final TextEditingController complaintController = TextEditingController();

  @override
  void dispose() {
    complaintController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Consumer<SupportProvider>(
      builder: (context, provider, _) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              ImageHelpAndSupportPage(),

              SizedBox(height: width * 0.01),

              HowWeCanHelpYouText(),

              SelectedRequestTypeText(),

              FormFieldForDescribeIssue(controller: complaintController),

              SizedBox(height: width * 0.06),

              PrimaryButton(
                name: provider.isLoading ? "Sending..." : "Submit Request",

                pushing: () async {
                  if (complaintController.text.trim().isEmpty) {
                    return;
                  }

                  await provider.submitComplaint(
                    message: complaintController.text.trim(),

                    context: context,
                  );

                  complaintController.clear();
                },
              ),

              SizedBox(height: width * 0.04),
            ],
          ),
        );
      },
    );
  }
}

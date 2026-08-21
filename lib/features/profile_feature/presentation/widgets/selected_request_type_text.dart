import 'package:estatelqapp/core/widgets/custom_font.dart';
import 'package:estatelqapp/features/profile_feature/presentation/providers/support_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedRequestTypeText extends StatelessWidget {
  const SelectedRequestTypeText({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Consumer<SupportProvider>(
      builder: (context, provider, _) {
        return Padding(
          padding: EdgeInsets.only(
            left: width * 0.06,
            right: width * 0.06,
            top: width * 0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFont(
                name: "What's your problem?",
                fontColor: Theme.of(context)
                    .colorScheme
                    .onSurface,
                fontSize: width * 0.035,
              ),

              SizedBox(height: width * 0.025),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .outline
                        .withOpacity(0.35),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.035,
                  ),
                  child: provider.isLoadingTypes
                      ? SizedBox(
                          height: width * 0.13,
                          child: const Center(
                            child: SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                        )
                      : provider.typesError != null
                          ? SizedBox(
                              height: width * 0.13,
                              child: Center(
                                child: CustomFont(
                                  name: "Failed to load complaint types",
                                  fontColor: Colors.red,
                                  fontSize: width * 0.03,
                                ),
                              ),
                            )
                          : DropdownButtonHideUnderline(
                              child: DropdownButton<
                                  dynamic>(
                                value:
                                    provider.selectedComplaintType,
                                isExpanded: true,
                                borderRadius:
                                    BorderRadius.circular(14),
                                hint: CustomFont(
                                  name: "Select complaint type",
                                  fontColor: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.55),
                                  fontSize: width * 0.03,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface,
                                ),
                                items: provider.complaintTypes
                                    .map(
                                      (type) =>
                                          DropdownMenuItem<
                                              dynamic>(
                                        value: type,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 36,
                                              height: 36,
                                              decoration:
                                                  BoxDecoration(
                                                borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                  10,
                                                ),
                                                color: Theme.of(
                                                        context)
                                                    .colorScheme
                                                    .primary
                                                    .withOpacity(
                                                      0.1,
                                                    ),
                                              ),
                                              child: Icon(
                                                Icons
                                                    .report_problem_outlined,
                                                size: 20,
                                                color: Theme.of(
                                                        context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                            ),

                                            SizedBox(
                                              width:
                                                  width * 0.025,
                                            ),

                                            Expanded(
                                              child: CustomFont(
                                                name: type.name,
                                                fontColor: Theme.of(
                                                        context)
                                                    .colorScheme
                                                    .onSurface,
                                                fontSize:
                                                    width * 0.03,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: provider
                                        .isLoading
                                    ? null
                                    : (value) {
                                        provider
                                            .selectComplaintType(
                                          value,
                                        );
                                      },
                              ),
                            ),
                ),
              ),

              SizedBox(height: width * 0.015),

              if (provider.selectedComplaintType != null)
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.01,
                  ),
                  child: CustomFont(
                    name:
                        "Selected: ${provider.selectedComplaintType!.name}",
                    fontColor: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.55),
                    fontSize: width * 0.025,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
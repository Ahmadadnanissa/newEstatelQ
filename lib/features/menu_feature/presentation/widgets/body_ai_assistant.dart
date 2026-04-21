import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/body_message_for_ai.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/custom_text_field_for_send_message.dart';
import 'package:flutter/material.dart';

class BodyAiAssistant extends StatelessWidget {
  const BodyAiAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.04),
      child: Container(
        width: width * 0.72,
        height: width,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(width * 0.02),
          border: Border.all(color: greenColor, width: 1),
        ),
        child: Column(
          children: [
            SizedBox(
              width: width * 0.72,
              height: width * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BodyMeesageForAi(
                      isUserMessage: true,
                      message: 'Hello , I need help',
                    ),
                    BodyMeesageForAi(
                      isUserMessage: false,
                      message:
                          'Hi, i’m ahmad I’m a manager that’s here to help',
                    ),
                    BodyMeesageForAi(
                      isUserMessage: true,
                      message: 'Looks good!,i want to sign upfor a viewing',
                    ),
                    BodyMeesageForAi(
                      isUserMessage: false,
                      message: 'This is a it has 3 bed',
                    ),
                    BodyMeesageForAi(
                      isUserMessage: true,
                      message: 'Hello , I need help',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  SizedBox(width: width * 0.04),
                  CustomTextFieldForSendMessage(),
                  SizedBox(width: width * 0.02),
                  Icon(Icons.send, size: width * 0.07, color: secondaryColor),
                  SizedBox(width: width * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

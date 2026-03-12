import 'package:estatelqapp/features/menu_feature/presentation/widgets/body_message.dart';
import 'package:flutter/material.dart';

class BodyLiveChatPage extends StatelessWidget {
  const BodyLiveChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BodyMessage(isUserMessage: true, message: 'Hello , I need help'),
          BodyMessage(
            isUserMessage: false,
            message: 'Hi, i’m ahmad I’m a manager that’s here to help',
          ),
          BodyMessage(
            isUserMessage: true,
            message: 'Looks good!,i want to sign upfor a viewing',
          ),
          BodyMessage(isUserMessage: false, message: 'This is a it has 3 bed'),
          BodyMessage(isUserMessage: true, message: 'Hello , I need help'),
          BodyMessage(
            isUserMessage: false,
            message: 'Hi, i’m ahmad I’m a manager that’s here to help',
          ),
          BodyMessage(
            isUserMessage: true,
            message: 'Looks good!,i want to sign upfor a viewing',
          ),
          BodyMessage(isUserMessage: false, message: 'This is a it has 3 bed'),
        ],
      ),
    );
  }
}

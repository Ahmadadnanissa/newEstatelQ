import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/chat_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/custom_text_field_for_send_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarForLiveChatPage extends StatelessWidget {
  const BottomNavigationBarForLiveChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        children: [
          Icon(
            Icons.image_outlined,
            size: width * 0.075,
            color: Theme.of(context).colorScheme.primary,
          ),

          SizedBox(width: width * 0.02),

          Icon(
            Icons.mic_none_outlined,
            size: width * 0.075,
            color: Theme.of(context).colorScheme.primary,
          ),

          SizedBox(width: width * 0.02),

          Expanded(
            child: Consumer<ChatProvider>(
              builder: (context, provider, child) {
                return CustomTextFieldForSendMessage();
              },
            ),
          ),

          SizedBox(width: width * 0.02),

          GestureDetector(
            onTap: () {
              context.read<ChatProvider>().sendMessage();
            },
            child: Icon(
              Icons.send,
              size: width * 0.075,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

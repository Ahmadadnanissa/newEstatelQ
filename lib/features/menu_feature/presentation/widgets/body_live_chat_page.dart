import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/chat_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/body_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyLiveChatPage extends StatefulWidget {
  const BodyLiveChatPage({super.key, required this.dealId});
  final String dealId;

  @override
  State<BodyLiveChatPage> createState() => _BodyLiveChatPageState();
}

class _BodyLiveChatPageState extends State<BodyLiveChatPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<ChatProvider>().connect();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.messages.length,
          itemBuilder: (context, index) {
            final msg = provider.messages[index];

            return BodyMessage(
              isUserMessage: msg.senderId == provider.myId,
              message: msg.message,
            );
          },
        );
      },
    );
  }
}

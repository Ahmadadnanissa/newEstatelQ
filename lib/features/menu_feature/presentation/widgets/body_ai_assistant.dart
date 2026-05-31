import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/chat_with_ai_provider.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/body_message_for_ai.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/field_for_send_message_with_ai.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyAiAssistant extends StatelessWidget {
  const BodyAiAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.04),
      child: Container(
        width: width * 0.72,
        height: width,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(width * 0.03),
          border: Border.all(color: colorScheme.primary.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Consumer<ChatWithAiProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Expanded(
                  child: provider.messages.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'Ask me anything about real estate, properties, investments, neighborhoods or weather conditions.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: colorScheme.onSurface.withOpacity(0.6),
                                fontSize: width * 0.03,
                              ),
                            ),
                          ),
                        )
                      : ListView.builder(
                          reverse: true,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemCount:
                              provider.messages.length +
                              (provider.isLoading ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (provider.isLoading &&
                                index == provider.messages.length) {
                              return const Padding(
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text("AI is typing..."),
                                  ],
                                ),
                              );
                            }

                            final message = provider.messages[index];

                            return BodyMeesageForAi(
                              isUserMessage: message.isUser,
                              message: message.message,
                            );
                          },
                        ),
                ),

                Divider(height: 1, color: colorScheme.outline.withOpacity(0.2)),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),

                      const Expanded(child: FieldForSendMessageWithAi()),

                      const SizedBox(width: 10),

                      InkWell(
                        onTap:
                            provider.controller.text.trim().isEmpty ||
                                provider.isLoading
                            ? null
                            : () => provider.sendMessage(),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color:
                                provider.controller.text.trim().isEmpty ||
                                    provider.isLoading
                                ? Colors.grey
                                : colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.send_rounded,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

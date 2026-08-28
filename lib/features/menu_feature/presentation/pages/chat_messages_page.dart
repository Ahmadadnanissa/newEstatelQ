import 'dart:async';
import 'dart:convert';

import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:estatelqapp/features/menu_feature/data/models/chat_message_model1.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/messages_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatMessagesPage extends StatefulWidget {
  final String roomId;
  final String? chatName;

  const ChatMessagesPage({super.key, required this.roomId, this.chatName});

  @override
  State<ChatMessagesPage> createState() => _ChatMessagesPageState();
}

class _ChatMessagesPageState extends State<ChatMessagesPage> {
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _messageFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  Timer? _refreshTimer;
  int _lastMessageCount = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MessagesProvider>().getMessages(widget.roomId);
    });

    _refreshTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!mounted) {
        return;
      }

      context.read<MessagesProvider>().refreshMessages(widget.roomId);
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    _messageController.dispose();
    _messageFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    await context.read<MessagesProvider>().getMessages(widget.roomId);
  }

  Future<void> _sendMessage() async {
    final message = _messageController.text.trim();

    if (message.isEmpty) {
      return;
    }

    final provider = context.read<MessagesProvider>();

    final success = await provider.sendMessage(widget.roomId, message);

    if (!mounted) {
      return;
    }

    if (success) {
      _messageController.clear();
      _messageFocusNode.requestFocus();
      _scrollToLatestMessage();
    } else if (provider.sendError != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(provider.sendError!)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.chatName ?? 'Chat',
          style: const TextStyle(
            color: Color(0xFF171717),
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<MessagesProvider>(
              builder: (context, provider, child) {
                if (provider.messages.length != _lastMessageCount) {
                  _lastMessageCount = provider.messages.length;
                  _scrollToLatestMessage();
                }

                if (provider.isLoading && provider.messages.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.error != null && provider.messages.isEmpty) {
                  return _ErrorView(
                    message: provider.error!,
                    onRetry: _refresh,
                  );
                }

                if (provider.messages.isEmpty) {
                  return RefreshIndicator(
                    onRefresh: _refresh,
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: const [
                        SizedBox(height: 250),
                        Center(
                          child: Text(
                            'No messages yet',
                            style: TextStyle(
                              color: Color(0xFF777C84),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView.builder(
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(14, 20, 14, 30),
                    itemCount: provider.messages.length,
                    itemBuilder: (context, index) {
                      final message = provider.messages[index];

                      return _MessageBubble(
                        message: message,
                        currentUserIds: _currentUserIds(),
                      );
                    },
                  ),
                );
              },
            ),
          ),

          _MessageInput(
            controller: _messageController,
            focusNode: _messageFocusNode,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }

  void _scrollToLatestMessage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) {
        return;
      }

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }
}

class _MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSend;

  const _MessageInput({
    required this.controller,
    required this.focusNode,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MessagesProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: EdgeInsets.only(
            left: 12,
            right: 12,
            top: 10,
            bottom: MediaQuery.of(context).padding.bottom + 10,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Color(0xFFE7E9ED))),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  minLines: 1,
                  maxLines: 5,
                  textInputAction: TextInputAction.newline,
                  enabled: !provider.isSending,
                  decoration: InputDecoration(
                    hintText: 'Write a message...',
                    hintStyle: const TextStyle(
                      color: Color(0xFF999EA5),
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF7F8FA),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: const BorderSide(color: Color(0xFFE0E3E8)),
                    ),
                  ),
                  onSubmitted: (_) {
                    _sendIfPossible(context);
                  },
                ),
              ),

              const SizedBox(width: 8),

              SizedBox(
                width: 46,
                height: 46,
                child: Material(
                  color: provider.isSending
                      ? const Color(0xFFBFC3C8)
                      : const Color(0xFF25282C),
                  borderRadius: BorderRadius.circular(23),
                  child: InkWell(
                    onTap: provider.isSending
                        ? null
                        : () => _sendIfPossible(context),
                    borderRadius: BorderRadius.circular(23),
                    child: Center(
                      child: provider.isSending
                          ? const SizedBox(
                              width: 19,
                              height: 19,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : const Icon(
                              Icons.send_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _sendIfPossible(BuildContext context) {
    if (controller.text.trim().isEmpty) {
      return;
    }

    onSend();
  }
}

class _MessageBubble extends StatelessWidget {
  final ChatMessageModel1 message;
  final Set<String> currentUserIds;

  const _MessageBubble({required this.message, required this.currentUserIds});

  @override
  Widget build(BuildContext context) {
    final isDeleted = message.isDeleted;
    final isMine = _isMine();
    final bubbleColor = isMine ? const Color(0xFF25282C) : Colors.white;
    final textColor = isMine
        ? Colors.white
        : isDeleted
        ? const Color(0xFF999EA5)
        : const Color(0xFF25282C);
    final metaColor = isMine
        ? Colors.white.withValues(alpha: 0.72)
        : const Color(0xFF999EA5);

    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.78,
        ),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(isMine ? 18 : 5),
            bottomRight: Radius.circular(isMine ? 5 : 18),
          ),
          border: isMine ? null : Border.all(color: const Color(0xFFE7E9ED)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isDeleted ? 'This message was deleted' : (message.message ?? ''),
              style: TextStyle(
                color: textColor,
                fontSize: 14.5,
                height: 1.45,
                fontStyle: isDeleted ? FontStyle.italic : FontStyle.normal,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _formatTime(message.createdAt),
                  style: TextStyle(color: metaColor, fontSize: 10.5),
                ),
                if (message.isEdited && !message.isDeleted) ...[
                  const SizedBox(width: 7),
                  Text(
                    'Edited',
                    style: TextStyle(color: metaColor, fontSize: 10.5),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }

    try {
      final date = DateTime.parse(value).toLocal();

      final hour = date.hour.toString().padLeft(2, '0');
      final minute = date.minute.toString().padLeft(2, '0');

      return '$hour:$minute';
    } catch (_) {
      return '';
    }
  }

  bool _isMine() {
    final senderIds = <String>{
      message.userId ?? '',
      message.user?['id']?.toString() ?? '',
      message.user?['_id']?.toString() ?? '',
      message.user?['userId']?.toString() ?? '',
      message.user?['clientId']?.toString() ?? '',
      message.user?['employeeId']?.toString() ?? '',
    }..removeWhere((id) => id.trim().isEmpty);

    return senderIds.any(currentUserIds.contains);
  }
}

Set<String> _currentUserIds() {
  final token = LocalStorageService.getToken();
  final ids = <String>{
    LocalStorageService.getId() ?? '',
    if (token != null) ..._idsFromToken(token),
  }..removeWhere((id) => id.trim().isEmpty || id.toLowerCase() == 'null');

  return ids;
}

Set<String> _idsFromToken(String token) {
  final parts = token.split('.');
  if (parts.length < 2) {
    return const {};
  }

  try {
    final normalized = base64Url.normalize(parts[1]);
    final payload = utf8.decode(base64Url.decode(normalized));
    final decoded = jsonDecode(payload);
    if (decoded is! Map) {
      return const {};
    }

    return {
      decoded['id']?.toString() ?? '',
      decoded['userId']?.toString() ?? '',
      decoded['sub']?.toString() ?? '',
      decoded['clientId']?.toString() ?? '',
      decoded['employeeId']?.toString() ?? '',
    }..removeWhere((id) => id.trim().isEmpty || id.toLowerCase() == 'null');
  } catch (_) {
    return const {};
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final Future<void> Function() onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 55,
              color: Color(0xFFB54A4A),
            ),
            const SizedBox(height: 15),
            const Text(
              'Unable to load messages',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Color(0xFF777C84), fontSize: 13),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}

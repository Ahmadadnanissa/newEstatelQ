import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/internal_chats_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/chat_room_model.dart';
import 'chat_messages_page.dart';

class InternalChatsPage extends StatefulWidget {
  const InternalChatsPage({super.key});

  @override
  State<InternalChatsPage> createState() => _InternalChatsPageState();
}

class _InternalChatsPageState extends State<InternalChatsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<InternalChatsProvider>().getChats();
    });
  }

  Future<void> _refreshChats() async {
    await context.read<InternalChatsProvider>().getChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          'Chats',
          style: TextStyle(
            color: Color(0xFF171717),
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _refreshChats,
            icon: const Icon(Icons.refresh_rounded, color: Color(0xFF171717)),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Consumer<InternalChatsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.chats.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null && provider.chats.isEmpty) {
            return _ErrorState(
              message: provider.error!,
              onRetry: _refreshChats,
            );
          }

          if (provider.chats.isEmpty) {
            return _EmptyChatsState(onRefresh: _refreshChats);
          }

          return RefreshIndicator(
            onRefresh: _refreshChats,
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 30),
              itemCount: provider.chats.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final chat = provider.chats[index];

                return ChatRoomCard(
                  chat: chat,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatMessagesPage(
                          roomId: chat.id,
                          chatName: chat.name,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ChatRoomCard extends StatelessWidget {
  final ChatRoomModel chat;
  final VoidCallback? onTap;

  const ChatRoomCard({super.key, required this.chat, this.onTap});

  @override
  Widget build(BuildContext context) {
    final String chatName = chat.name?.trim().isNotEmpty == true
        ? chat.name!.trim()
        : 'Unnamed Chat';

    final String chatDescription = chat.description?.trim().isNotEmpty == true
        ? chat.description!.trim()
        : 'No description available';

    final String chatType = chat.type?.trim().isNotEmpty == true
        ? chat.type!.trim()
        : 'CHAT';

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE9EBEF)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 14,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ChatImage(imageUrl: chat.image, name: chatName),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            chatName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xFF171717),
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _TypeBadge(type: chatType),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      chatDescription,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF70757D),
                        fontSize: 13.5,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          size: 15,
                          color: Color(0xFF92979F),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            _formatDate(chat.updatedAt ?? chat.createdAt),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xFF92979F),
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
                          color: Color(0xFF92979F),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'No date';
    }

    try {
      final date = DateTime.parse(value).toLocal();

      final day = date.day.toString().padLeft(2, '0');
      final month = date.month.toString().padLeft(2, '0');
      final year = date.year.toString();

      return '$day/$month/$year';
    } catch (_) {
      return value;
    }
  }
}

class _ChatImage extends StatelessWidget {
  final String? imageUrl;
  final String name;

  const _ChatImage({required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    final hasImage = imageUrl != null && imageUrl!.trim().isNotEmpty;

    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: const Color(0xFFF0F2F5),
      ),
      clipBehavior: Clip.antiAlias,
      child: hasImage
          ? Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return _PlaceholderImage(name);
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
            )
          : _PlaceholderImage(name),
    );
  }
}

class _PlaceholderImage extends StatelessWidget {
  final String name;

  const _PlaceholderImage(this.name);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : 'C',
        style: const TextStyle(
          color: Color(0xFF555A61),
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _TypeBadge extends StatelessWidget {
  final String type;

  const _TypeBadge({required this.type});

  @override
  Widget build(BuildContext context) {
    String text;

    switch (type) {
      case 'INTERNAL_GROUP':
        text = 'Group';
        break;

      case 'INTERNAL_DIRECT':
        text = 'Direct';
        break;

      default:
        text = type;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF555A61),
          fontSize: 10.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _EmptyChatsState extends StatelessWidget {
  final Future<void> Function() onRefresh;

  const _EmptyChatsState({required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                color: const Color(0xFFEFF1F4),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.chat_bubble_outline_rounded,
                size: 36,
                color: Color(0xFF6B7078),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'No chats yet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF171717),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your conversations will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Color(0xFF777C84)),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: onRefresh,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final Future<void> Function() onRetry;

  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF1F1),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.error_outline_rounded,
                size: 36,
                color: Color(0xFFB54A4A),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Something went wrong',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: Color(0xFF171717),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, color: Color(0xFF777C84)),
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

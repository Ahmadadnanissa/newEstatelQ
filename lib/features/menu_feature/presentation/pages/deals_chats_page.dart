import 'package:estatelqapp/features/menu_feature/presentation/pages/chat_messages_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/my_deals_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/deal_chat_room_model.dart';

class DealsChatsPage extends StatefulWidget {
  const DealsChatsPage({super.key});

  @override
  State<DealsChatsPage> createState() => _DealsChatsPageState();
}

class _DealsChatsPageState extends State<DealsChatsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MyDealsProvider>().getMyDeals();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: AppBar(
        title: const Text("Deal Chats"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer<MyDealsProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading && provider.deals.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null && provider.deals.isEmpty) {
            return Center(child: Text(provider.error!));
          }

          if (provider.deals.isEmpty) {
            return const Center(child: Text("No Deal Chats"));
          }

          return RefreshIndicator(
            onRefresh: provider.getMyDeals,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: provider.deals.length,
              itemBuilder: (_, index) {
                final deal = provider.deals[index];

                return DealChatCard(
                  deal: deal,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatMessagesPage(
                          roomId: deal.id,
                          chatName: deal.name,
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

class DealChatCard extends StatelessWidget {
  final DealChatRoomModel deal;
  final VoidCallback onTap;

  const DealChatCard({super.key, required this.deal, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: deal.image != null
                    ? NetworkImage(deal.image!)
                    : null,
                child: deal.image == null
                    ? const Icon(Icons.home_work_rounded)
                    : null,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      deal.name ?? "Unnamed Deal",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      deal.description ?? "No Description",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Chip(label: Text(deal.type ?? "DEAL")),
                        const SizedBox(width: 8),
                        Text(
                          "${deal.roomMembers.length} Members",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'assistant_screen.dart';

class MessagesScreen extends StatelessWidget {
  static const List<_Conversation> _conversations = [
    _Conversation(
      name: 'Assistant AgriBen',
      lastMessage: 'Plusieurs causes sont possibles. Vérifiez l\'arrosage...',
      time: '14:30',
      unread: 1,
      emoji: '🌾',
      isSystem: true,
    ),
    _Conversation(
      name: 'Koffi Adom',
      lastMessage: 'Le soja est toujours disponible pour 350 FCFA/kg',
      time: '13:45',
      unread: 2,
      emoji: '👨‍🌾',
    ),
    _Conversation(
      name: 'Coopérative Zè',
      lastMessage: 'La réunion de la coopérative est prévue samedi.',
      time: '11:20',
      unread: 0,
      emoji: '🤝',
    ),
    _Conversation(
      name: 'Adjovi Maxime',
      lastMessage: 'J\'ai 500 kg de tomates disponibles cette semaine.',
      time: 'Hier',
      unread: 0,
      emoji: '🍅',
    ),
    _Conversation(
      name: 'Agro-Distribution',
      lastMessage: 'Votre commande de semences est en route.',
      time: 'Lun',
      unread: 0,
      emoji: '🚛',
    ),
  ];

  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Text('Messages', style: AppTextStyles.h1),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher...',
                prefixIcon: const Icon(Icons.search, color: AppColors.textMuted, size: 22),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: false,
                hintStyle: AppTextStyles.body.copyWith(color: AppColors.textMuted),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: _conversations.length,
            itemBuilder: (context, index) {
              final conv = _conversations[index];
              return _buildConversationTile(context, conv);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildConversationTile(BuildContext context, _Conversation conv) {
    return GestureDetector(
      onTap: () {
        if (conv.isSystem) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AssistantScreen()),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: conv.isSystem
                    ? AppColors.forestGreen.withValues(alpha: 0.1)
                    : AppColors.border.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(conv.emoji, style: const TextStyle(fontSize: 24)),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        conv.name,
                        style: AppTextStyles.bodyLarge.copyWith(fontSize: 15),
                      ),
                      Text(conv.time, style: AppTextStyles.caption),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          conv.lastMessage,
                          style: AppTextStyles.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (conv.unread > 0) ...[
                        const SizedBox(width: 8),
                        Container(
                          width: 22,
                          height: 22,
                          decoration: const BoxDecoration(
                            color: AppColors.forestGreen,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              conv.unread.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Conversation {
  final String name;
  final String lastMessage;
  final String time;
  final int unread;
  final String emoji;
  final bool isSystem;

  const _Conversation({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unread,
    required this.emoji,
    this.isSystem = false,
  });
}

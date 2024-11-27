import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:hive/hive.dart';

part 'cached_messages.g.dart';

@HiveType(typeId: 0)
class CachedMessages {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String text;

  @HiveField(2)
  final DateTime createdAt;

  CachedMessages({
    required this.userId,
    required this.text,
    required this.createdAt,
  });

  factory CachedMessages.fromChatMessage(ChatMessage message) {
    return CachedMessages(
      userId: message.user.id,
      text: message.text,
      createdAt: message.createdAt,
    );
  }

  ChatMessage toChatMessage(ChatUser user, ChatUser geminiUser) {
    final isFromCurrentUser = userId == user.id;
    return ChatMessage(
      user: isFromCurrentUser ? user : geminiUser,
      createdAt: createdAt,
      text: text,
    );
  }
}

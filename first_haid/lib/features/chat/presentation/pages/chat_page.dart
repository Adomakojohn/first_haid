import 'package:first_haid/features/chat/presentation/widgets/my_chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<MyChatBubble> chatBubble = [
    const MyChatBubble(textfieldMessage: 'Hello', isSender: true),
    const MyChatBubble(
        textfieldMessage: 'Hello, how can I help you today', isSender: false),
    const MyChatBubble(
        textfieldMessage: 'Hello, how can I help you today', isSender: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "First-Haid AI",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment:
                chatBubble[1].isSender && chatBubble[0].isSender == false
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
            children: [
              MyChatBubble(
                textfieldMessage: chatBubble[0].textfieldMessage,
                isSender: chatBubble[1].isSender,
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatPage extends StatefulWidget {
  final String homeQuestion;
  const ChatPage({super.key, required this.homeQuestion});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];
  ChatUser currentUser = ChatUser(id: '0', firstName: "User");
  ChatUser geminiUser = ChatUser(id: '1', firstName: "First-Haid");

  @override
  void initState() {
    super.initState();
    if (widget.homeQuestion.isNotEmpty) {
      // Create an initial ChatMessage with the homeQuestion
      final initialMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: widget.homeQuestion,
      );

      // Add the message to the chat and send it to the AI
      _sendMessage(initialMessage);
    }
  }

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
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
        currentUser: currentUser, onSend: _sendMessage, messages: messages);
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });

    try {
      String question = chatMessage.text;

      // Ensure the Gemini response stream works as expected
      gemini.streamGenerateContent(question).listen(
        (event) {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";

          // Check if the last message is from the AI (geminiUser)
          if (messages.isNotEmpty && messages.first.user == geminiUser) {
            // If the last message is from the AI, append to its text
            setState(() {
              messages.first.text += response;
            });
          } else {
            // Otherwise, create a new message for the AI's response
            setState(() {
              messages = [
                ChatMessage(
                  user: geminiUser,
                  createdAt: DateTime.now(),
                  text: response,
                ),
                ...messages,
              ];
            });
          }
        },
        onError: (error) {
          // Handle stream errors gracefully
          print("Error in AI response stream: $error");
        },
      );
    } catch (e) {
      // Handle any other errors during message sending
      print("Error sending message: $e");
    }
  }
}

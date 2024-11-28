import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:hive/hive.dart';

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
  late Box<Map> chatBox;

  @override
  void initState() {
    super.initState();
    _initializeHive();
  }

  Future<void> _initializeHive() async {
    // Open the Hive box for chat messages
    chatBox = await Hive.openBox<Map>('chatMessages');

    _loadCachedMessages();

    if (widget.homeQuestion.isNotEmpty) {
      final initialMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: widget.homeQuestion,
      );

      _sendMessage(initialMessage);
    }
  }

  void _loadCachedMessages() {
    final cachedMessages = chatBox.values.map((messageData) {
      return ChatMessage(
        user:
            messageData['userId'] == currentUser.id ? currentUser : geminiUser,
        createdAt: DateTime.parse(messageData['createdAt']),
        text: messageData['text'],
      );
    }).toList();

    setState(() {
      messages = cachedMessages.reversed.toList();
    });
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
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });

    // Save the user's message to Hive
    chatBox.add({
      'userId': chatMessage.user.id,
      'text': chatMessage.text,
      'createdAt': chatMessage.createdAt.toIso8601String(),
    });

    try {
      String question = chatMessage.text;

      gemini.streamGenerateContent(question).listen(
        (event) {
          String responseChunk = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";

          if (messages.isNotEmpty && messages.first.user == geminiUser) {
            setState(() {
              messages.first.text += responseChunk;
            });

            // Update the existing AI response in Hive
            int indexToUpdate = chatBox.keys.last;
            chatBox.put(indexToUpdate, {
              'userId': geminiUser.id,
              'text': messages.first.text,
              'createdAt': messages.first.createdAt.toIso8601String(),
            });
          } else {
            // Create a new AI response message for the first chunk
            final responseMessage = ChatMessage(
              user: geminiUser,
              createdAt: DateTime.now(),
              text: responseChunk,
            );

            setState(() {
              messages = [responseMessage, ...messages];
            });

            // Save the new AI response to Hive
            chatBox.add({
              'userId': geminiUser.id,
              'text': responseMessage.text,
              'createdAt': responseMessage.createdAt.toIso8601String(),
            });
          }
        },
        onError: (error) {
          print("Error in AI response stream: $error");
        },
      );
    } catch (e) {
      print("Error sending message: $e");
    }
  }
}

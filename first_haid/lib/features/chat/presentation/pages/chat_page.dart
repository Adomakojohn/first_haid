// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    // Open Hive box for chat messages
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

  void _clearChatMessages() async {
    // Clear Hive
    await chatBox.clear();

    // Clear Firestore
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final conversationsRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('conversations');

      final snapshots = await conversationsRef.get();
      for (var doc in snapshots.docs) {
        await doc.reference.delete();
      }
    }

    // Clear local messages list
    setState(() {
      messages = [];
    });
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

  void _confirmClearChatMessages() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Clear Chat"),
          content:
              const Text("Are you sure you want to delete all chat messages?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _clearChatMessages();
                Navigator.of(context).pop();
              },
              child: const Text("Clear"),
            ),
          ],
        );
      },
    );
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
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _confirmClearChatMessages();
            },
          ),
        ],
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

    // Save to Firestore
    _saveMessageToFirestore(chatMessage);

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

            // Update the existing gemini response in Hive
            int indexToUpdate = chatBox.keys.last;
            chatBox.put(indexToUpdate, {
              'userId': geminiUser.id,
              'text': messages.first.text,
              'createdAt': messages.first.createdAt.toIso8601String(),
            });

            // Update the existing gemini response in Firestore
            _updateFirestoreMessage(messages.first);
          } else {
            // Create a new gemini response message for the first chunk
            final responseMessage = ChatMessage(
              user: geminiUser,
              createdAt: DateTime.now(),
              text: responseChunk,
            );

            setState(() {
              messages = [responseMessage, ...messages];
            });

            // Save the new gemini response to Hive
            chatBox.add({
              'userId': geminiUser.id,
              'text': responseMessage.text,
              'createdAt': responseMessage.createdAt.toIso8601String(),
            });

            // Save the new gemini response to Firestore
            _saveMessageToFirestore(responseMessage);
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

  Future<void> _saveMessageToFirestore(ChatMessage message) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print("No authenticated user.");
      return;
    }

    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('conversations')
          .doc();

      await docRef.set({
        'userId': message.user.id,
        'text': message.text,
        'createdAt': message.createdAt.toIso8601String(),
      });

      print("Message saved to Firestore.");
    } catch (e) {
      print("Error saving message to Firestore: $e");
    }
  }

  Future<void> _updateFirestoreMessage(ChatMessage message) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print("No authenticated user.");
      return;
    }

    try {
      final conversationsRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('conversations');

      final snapshots = await conversationsRef
          .where('createdAt', isEqualTo: message.createdAt.toIso8601String())
          .get();

      if (snapshots.docs.isNotEmpty) {
        final docRef = snapshots.docs.first.reference;
        await docRef.update({'text': message.text});
        print("Message updated in Firestore.");
      }
    } catch (e) {
      print("Error updating Firestore message: $e");
    }
  }
}

import 'package:flutter/material.dart';
import 'package:notjusthack_app/models/chat.dart';
import 'package:notjusthack_app/pages/chat_screen.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<Chat> chats = [
    Chat(
      senderName: "John Doe",
      senderAvatar: "https://example.com/avatar1.jpg",
      lastMessage: "Hey, how are you?",
      timestamp: "10:30 AM",
    ),
    Chat(
      senderName: "Jane Smith",
      senderAvatar: "https://example.com/avatar2.jpg",
      lastMessage: "Did you finish the project?",
      timestamp: "Yesterday",
    ),
    // Add more chats here...
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(chat.senderAvatar),
          ),
          title: Text(
            chat.senderName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(chat.lastMessage),
          trailing: Text(chat.timestamp),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(chat: chat),
              ),
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notjusthack_app/models/chat.dart';
import 'package:notjusthack_app/models/message.dart';

class ChatScreen extends StatefulWidget {
  final Chat chat;

  const ChatScreen({required this.chat});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
      sender: "John Doe",
      text: "Hey, how are you?",
      timestamp: "10:30 AM",
    ),
    Message(
      sender: "You",
      text: "I'm good, thanks!",
      timestamp: "10:32 AM",
    ),
    // Add more messages here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chat.senderName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  title: Text(
                    message.sender,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(message.text),
                  trailing: Text(message.timestamp),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Send message logic
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

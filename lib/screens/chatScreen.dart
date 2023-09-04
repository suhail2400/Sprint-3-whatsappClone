import 'package:flutter/material.dart';
import 'package:whatsapp_clone/lists.dart';
import 'package:whatsapp_clone/widgets/chat_tile.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ChatTile(data: chatList[index]);
        },
        itemCount: chatList.length,
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.chat)),
    );
  }
}

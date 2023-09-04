import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/singleChatModel.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key, required this.message});

  SingleChat message;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment:
            message.isSend ? Alignment.centerRight : Alignment.centerLeft,
        child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 150,
            ),
            child: Card(
                color: message.isSend ? Colors.greenAccent : Colors.white,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 45, bottom: 20),
                      child: Text(message.message),
                    ),
                    Positioned(
                        top: 14,
                        right: 3,
                        child: Row(
                          children: [
                            Text(message.sendAt),
                            message.isSend
                                ? Icon(Icons.done_all,
                                    size: 10,
                                    color: message.isReaded
                                        ? Colors.blue
                                        : Colors.grey)
                                : const SizedBox(),
                          ],
                        ))
                  ],
                ))));
  }
}

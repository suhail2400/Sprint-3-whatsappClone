import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/lists.dart';
import 'package:whatsapp_clone/models/ChatModel.dart';
import 'package:whatsapp_clone/models/singleChatModel.dart';
import 'package:whatsapp_clone/widgets/chatBubble.dart';
import 'package:whatsapp_clone/widgets/utility.dart';

class ChatDetailsScreen extends StatefulWidget {
  ChatDetailsScreen({super.key, required this.data});

  Chat data;

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  TextEditingController messageController = TextEditingController();
  bool showSend = false;
  bool showEmoji = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leadingWidth: 80,
        leading: Row(
          children: [
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            UtilityWidget().widthSpacer(5),
            CircleAvatar(
              radius: 20,
              backgroundImage: (widget.data.avatar == '')
                  ? NetworkImage((widget.data.isGroup)
                      ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_WKnYxghMcbNrWG-kqMDtv-vgny0a9mJKBQZKk38VJb0HO2NUnEasMU-v-_rKCMNFGpw&usqp=CAU'
                      : 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgarP7gU_IdnzZiuwzl3BUtTX4r6E7eIIwn7ShJEptzGi1uv4huuFjKqIX-pr8P_YZEL_UpSqcjXq4RCjMjKd-Dps40bEpw_lKofdvKnpDpDVGG6EHccFBn6jn9D-5Bu46Lt5VqZKMnCdx4-M2R3LB546OoPcdTB7uPeyKWbxbs6F1GXuhi52Sxmt3lEg/s650/DP.jpg')
                  : NetworkImage(widget.data.avatar),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data.name,
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              widget.data.status,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.video_call,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.call,
                color: Colors.white,
              )),
          PopupMenuButton(
            color: Colors.white,
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  child: Text('View Contact'),
                ),
                PopupMenuItem(
                  child: Text('Media,Links and Docs'),
                ),
                PopupMenuItem(
                  child: Text('Search'),
                ),
                PopupMenuItem(
                  child: Text('Mute Notifications'),
                ),
                PopupMenuItem(
                  child: Text('Disappearing Messages'),
                ),
                PopupMenuItem(
                  child: Text('Walpaper'),
                ),
                PopupMenuItem(
                  child: Text('More'),
                ),
              ];
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/walpaper.png',
              fit: BoxFit.cover,
            ),
          ),
          ListView.builder(
              itemCount: messageList.length,
              itemBuilder: (context, index) {
                return ChatBubble(message: messageList[index]);
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                          controller: messageController,
                          onChanged: (value) {
                            if (value.length > 0) {
                              setState(() {
                                showSend = true;
                              });
                            } else {
                              setState(() {
                                showSend = false;
                              });
                            }
                          },
                          onTap: () {
                            setState(() {
                              showEmoji = true;
                            });
                          },
                          cursorColor: Colors.teal,
                          decoration: InputDecoration(
                            hintText: 'Type your message',
                            prefixIcon: IconButton(
                              onPressed: () {
                                if (showEmoji) {
                                  FocusScope.of(context).unfocus();
                                }
                                setState(() {
                                  showEmoji = !showEmoji;
                                });
                              },
                              icon: showEmoji
                                  ? Icon(Icons.emoji_emotions_outlined)
                                  : Icon(Icons.keyboard),
                            ),
                            border: InputBorder.none,
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () => showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return attachMenu();
                                          },
                                        ),
                                    icon: Icon(Icons.attach_file)),
                                const Icon(Icons.currency_rupee_rounded),
                                UtilityWidget().widthSpacer(5),
                                const Icon(Icons.camera_alt),
                                UtilityWidget().widthSpacer(10),
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: FloatingActionButton(
                        backgroundColor: Colors.teal,
                        onPressed: () {
                          messageList.add(SingleChat(
                              isSend: true,
                              isReaded: false,
                              message: messageController.text,
                              sendAt: '5:00 pm'));
                          messageController.clear();
                        },
                        child: showSend
                            ? Icon(Icons.send, color: Colors.white)
                            : Icon(Icons.mic, color: Colors.white),
                      ),
                    )
                  ],
                ),
                Offstage(
                  offstage: showEmoji,
                  child: SizedBox(
                      height: 300,
                      child: EmojiPicker(
                        textEditingController: messageController,
                        onEmojiSelected: (category, emoji) {
                          setState(() {
                            showSend = true;
                          });
                        },
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container attachMenu() {
    return Container(
        height: 278,
        width: MediaQuery.of(context).size.width,
        child: Card(
            margin: EdgeInsets.all(15),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        iconWidget(
                            Icon(Icons.insert_drive_file, color: Colors.white),
                            Colors.indigo,
                            'Document', () {
                          print('Document');
                        }),
                        iconWidget(Icon(Icons.camera_alt, color: Colors.white),
                            Colors.pink, 'Camera', () {
                          print('Camera');
                        }),
                        iconWidget(
                            Icon(Icons.insert_photo, color: Colors.white),
                            Colors.purple,
                            'Gallery', () {
                          print('gallery');
                        }),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        iconWidget(Icon(Icons.headset, color: Colors.white),
                            Colors.orange, 'Audio', () {
                          print('audio');
                        }),
                        iconWidget(
                            Icon(Icons.location_pin, color: Colors.white),
                            Colors.teal,
                            'Location', () {
                          print('Location');
                        }),
                        iconWidget(
                            Icon(Icons.contact_phone, color: Colors.white),
                            Colors.blue,
                            'contact', () {
                          print('contact');
                        })
                      ],
                    )
                  ],
                ))));
  }

  Widget iconWidget(Icon icon, Color color, String text, Function fun) {
    return InkWell(
        onTap: () {
          fun();
        },
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 30,
              child: icon,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ));
  }
}

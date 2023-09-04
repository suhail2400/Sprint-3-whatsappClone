import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/ChatModel.dart';
import 'package:whatsapp_clone/screens/chatDetailsScreen.dart';
import 'package:whatsapp_clone/widgets/utility.dart';

class ChatTile extends StatefulWidget {
  ChatTile({super.key, required this.data});

  Chat data;
  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatDetailsScreen(data: widget.data),
            ));
      },
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: (widget.data.avatar == '')
            ? NetworkImage((widget.data.isGroup)
                ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_WKnYxghMcbNrWG-kqMDtv-vgny0a9mJKBQZKk38VJb0HO2NUnEasMU-v-_rKCMNFGpw&usqp=CAU'
                : 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgarP7gU_IdnzZiuwzl3BUtTX4r6E7eIIwn7ShJEptzGi1uv4huuFjKqIX-pr8P_YZEL_UpSqcjXq4RCjMjKd-Dps40bEpw_lKofdvKnpDpDVGG6EHccFBn6jn9D-5Bu46Lt5VqZKMnCdx4-M2R3LB546OoPcdTB7uPeyKWbxbs6F1GXuhi52Sxmt3lEg/s650/DP.jpg')
            : NetworkImage(widget.data.avatar),
      ),
      title: Text(widget.data.name.toString()),
      subtitle: Row(children: [
        Icon(Icons.done_all, color: Colors.blue),
        UtilityWidget().heightSpacer(6),
        Flexible(
            child: Text(
          widget.data.message.toString(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ))
      ]),
    );
  }
}

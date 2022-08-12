import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chats/chatdetailscreen.dart';
import 'package:whatsapp_clone/chats/models/chatmodel.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key, required this.chatData}) : super(key: key);
  final ChatModel chatData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatDetailScreen(chatDetail: chatData),
            ));
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: (chatData.avatar == '')
              ? AssetImage((chatData.isGroup!)
                  ? 'assets/images/group.png'
                  : 'assets/images/profile.jpg')
              : NetworkImage(chatData.avatar!) as ImageProvider,
        ),
        title: Text(chatData.name!),
        subtitle: Text(chatData.message!),
        trailing: Text(chatData.updatedAt!),
      ),
    );
  }
}

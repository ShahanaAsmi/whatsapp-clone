import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chats/chatt_ile.dart';
import 'package:whatsapp_clone/chats/models/chatmodel.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  List<ChatModel> chatlist = [
    ChatModel(
        avatar:
            'https://static.toiimg.com/thumb/msid-89278236,imgsize-51256,width-800,height-600,resizemode-75/89278236.jpg',
        isGroup: false,
        message: 'hello',
        name: 'Shahana',
        updatedAt: '9.00 am'),
    ChatModel(
        avatar:
            'https://i.kym-cdn.com/photos/images/original/000/940/042/42f.png',
        isGroup: true,
        message: 'hello',
        name: 'baabtra',
        updatedAt: '9.00 am'),
    ChatModel(
        avatar:
            'https://im.rediff.com/movies/2022/apr/28samantha1.jpg?w=670&h=900',
        isGroup: false,
        message: 'hii',
        name: 'Asmi',
        updatedAt: '9.00 am'),
    ChatModel(
        avatar: '',
        isGroup: true,
        message: 'hyyy',
        name: 'Samantha',
        updatedAt: '9.00 am'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatlist.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatTile(chatData: chatlist[index]);
        },
      ),
    );
  }
}

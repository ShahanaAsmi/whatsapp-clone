import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone/chats/models/chatmodel.dart';
import 'package:whatsapp_clone/chats/models/single_msg_model.dart';
import 'package:whatsapp_clone/chats/widgets/chat.bubble.dart';
import 'package:whatsapp_clone/chats/widgets/popupbox.dart';

class ChatDetailScreen extends StatefulWidget {
  ChatDetailScreen({Key? key, required this.chatDetail}) : super(key: key);
  ChatModel chatDetail;

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  bool isSend = false;
  bool showEmoji = false;

  final TextEditingController _messageController =
      TextEditingController(text: '');
  final FocusNode _focusNode = FocusNode();
  List<MessageModel> messages = [
    MessageModel(
        isReaded: true, isSend: true, message: 'Hii', sendAt: '9.00 am'),
    MessageModel(
        isReaded: false, isSend: false, message: 'podi', sendAt: '8.00 am'),
    MessageModel(
        isReaded: true, isSend: true, message: 'ooy', sendAt: '7.00 am'),
    MessageModel(
        isReaded: false, isSend: false, message: 'hyyyyyy', sendAt: '9.10 am'),
    MessageModel(
        isReaded: true, isSend: true, message: 'hw r u', sendAt: '5.00 am'),
    MessageModel(
        isReaded: false, isSend: false, message: 'fine', sendAt: '5.10 am'),
    MessageModel(
        isReaded: true, isSend: true, message: 'who r u', sendAt: '7.00 am'),
    MessageModel(
        isReaded: false, isSend: false, message: 'parjarla', sendAt: '7.01 am'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            const SizedBox(
              width: 5,
            ),
            CircleAvatar(
                backgroundImage: (widget.chatDetail.avatar == '')
                    ? AssetImage((widget.chatDetail.isGroup!)
                        ? 'assets/images/group.png'
                        : 'assets/images/profile.jpg')
                    : NetworkImage(widget.chatDetail.avatar!) as ImageProvider),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chatDetail.name.toString()),
            Text(
              'lastseen today at ${widget.chatDetail.updatedAt}',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
        actions: [
          const Icon(Icons.video_call),
          const SizedBox(
            width: 20,
          ),
          const Icon(Icons.call),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text((widget.chatDetail.isGroup!)
                      ? 'Group info'
                      : 'View contact'),
                ),
                PopupMenuItem(
                  child: Text((widget.chatDetail.isGroup!)
                      ? 'Group media'
                      : 'Media,links,and docs'),
                ),
                const PopupMenuItem(
                  child: Text('Search'),
                ),
                const PopupMenuItem(
                  child: Text('Mute notifications'),
                ),
                const PopupMenuItem(
                  child: Text('Disappearing messages'),
                ),
                const PopupMenuItem(
                  child: Text('Wallpapaer'),
                ),
                const PopupMenuItem(
                  child: Text('more'),
                ),
              ];
            },
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background.jpeg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatBubble(
                    messageData: messages[index],
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 70,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: TextField(
                          focusNode: _focusNode,
                          controller: _messageController,
                          onChanged: (value) {
                            if (value.length > 0) {
                              setState(() {
                                isSend = true;
                              });
                            } else {
                              setState(() {
                                isSend = false;
                              });
                            }
                          },
                          decoration: InputDecoration(
                              prefixIcon: IconButton(
                                onPressed: () {
                                  _focusNode.unfocus();
                                  setState(() {
                                    showEmoji = !showEmoji;
                                  });
                                },
                                icon: Icon((showEmoji)
                                    ? Icons.keyboard
                                    : Icons.emoji_emotions),
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.attach_file),
                                    onPressed: () {
                                      showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) => PopupBox());
                                    },
                                  ),
                                  const Icon(Icons.currency_rupee),
                                  const Icon(Icons.camera_alt),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                              hintText: 'message'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          String tdata =
                              DateFormat("hh:mm a").format(DateTime.now());
                          setState(() {
                            messages.add(MessageModel(
                                isReaded: false,
                                isSend: true,
                                message: _messageController.text,
                                sendAt: tdata));
                            _messageController.clear();
                          });
                        },
                        child: Icon((isSend) ? Icons.send : Icons.mic),
                      ),
                    ),
                  ],
                ),
                showEmoji == true ? selectEmoji() : Container()
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectEmoji() {
    return EmojiPicker(
      onEmojiSelected: (emoji, category) {
        _messageController.text = _messageController.text + emoji.emoji;
      },
    );
  }
}

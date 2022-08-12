import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chats/models/single_msg_model.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.messageData}) : super(key: key);
  final MessageModel messageData;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          messageData.isSend! ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 150),
        child: Card(
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 5, right: 30, top: 10, bottom: 20),
                child: Text(messageData.message!),
              ),
              Positioned(
                  bottom: 4,
                  right: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        '9.00 am',
                        style: TextStyle(fontSize: 10),
                      ),
                      Icon(Icons.done_all,
                          size: 15,
                          color:
                              messageData.isReaded! ? Colors.blue : Colors.grey)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

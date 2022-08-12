import 'package:flutter/material.dart';
import 'package:whatsapp_clone/call/callTile.dart';
import 'package:whatsapp_clone/call/callsModel.dart';

class CallScreen extends StatelessWidget {
  CallScreen({Key? key}) : super(key: key);
  List<CallModel> CallList = [
    CallModel(
      avatar: '',
      name: 'baabtra',
      date: 'july 3',
      updatedAt: '1:30 AM',
      isGroup: true,
      callType: false,
    ),
    CallModel(
      avatar: '',
      name: 'dulqur',
      date: 'december 3',
      updatedAt: '1:30 AM',
      isGroup: false,
      callType: true,
    ),
    CallModel(
      avatar: '',
      name: 'baabtra1',
      date: 'june 7',
      updatedAt: '1:30 AM',
      isGroup: false,
      callType: false,
    ),
    CallModel(
        avatar: '',
        name: 'baabtra2',
        date: 'april 3',
        updatedAt: '1:30 AM',
        isGroup: false,
        callType: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF387A57),
        onPressed: () {},
        child: const Icon(Icons.add_ic_call),
      ),
      body: ListView.builder(
        itemCount: CallList.length,
        itemBuilder: (BuildContext context, int index) {
          return CallTile(
            callData: CallList[index],
          );
        },
      ),
    );
  }
}

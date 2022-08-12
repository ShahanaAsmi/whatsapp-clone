import 'package:flutter/material.dart';
import 'package:whatsapp_clone/status/status_model.dart';
import 'package:whatsapp_clone/status/statustile.dart';

class StatusPage extends StatelessWidget {
  StatusPage({Key? key}) : super(key: key);
  List<StatusModel> statusList = [
    StatusModel(avatar: '', name: 'text0', updatedAt: '9.00 am'),
    StatusModel(avatar: '', name: 'text1', updatedAt: '9.00 am'),
    StatusModel(avatar: '', name: 'text2', updatedAt: '9.00 am'),
    StatusModel(avatar: '', name: 'text3', updatedAt: '9.00 am'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ListTile(
            title: Text('my status'),
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            child: ListView.builder(
              itemCount: statusList.length,
              itemBuilder: (BuildContext context, int index) {
                return StatusTile(
                  statusData: statusList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/status/status_model.dart';

class StatusTile extends StatelessWidget {
  StatusTile({Key? key, required this.statusData}) : super(key: key);
  StatusModel statusData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('a'),
      ),
      title: Text('b'),
      subtitle: Text(""),
    );
  }
}

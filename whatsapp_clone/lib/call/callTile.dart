import 'package:flutter/material.dart';
import 'package:whatsapp_clone/call/callsModel.dart';

class CallTile extends StatelessWidget {
  const CallTile({Key? key, required this.callData}) : super(key: key);
  final CallModel callData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey,
        child: Icon(Icons.person),
      ),
      title: Text(callData.updatedAt!),
      subtitle: Text(
        '${callData.date},${callData.updatedAt}',
      ),
      trailing: (callData.callType == true)
          ? const Icon(Icons.call)
          : const Icon(Icons.video_call),
    );
  }
}

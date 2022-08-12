import 'package:flutter/material.dart';

class PopupBox extends StatelessWidget {
  const PopupBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          margin: EdgeInsets.all(20),
          child: Column(children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(
                    icon: const Icon(Icons.insert_drive_file),
                    color: Colors.indigo,
                    text: 'Document'),
                iconWidget(
                    icon: Icon(Icons.camera_alt),
                    color: Colors.pinkAccent,
                    text: 'Camera'),
                iconWidget(
                    icon: Icon(Icons.insert_photo),
                    color: Colors.purple,
                    text: 'Gallery'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(
                    icon: Icon(Icons.headphones),
                    color: Colors.deepOrange,
                    text: 'Audio'),
                iconWidget(
                    icon: Icon(Icons.location_pin),
                    color: Colors.lightGreen,
                    text: 'Location'),
                iconWidget(
                    icon: Icon(Icons.currency_rupee_rounded),
                    color: Colors.greenAccent,
                    text: 'Payment'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                ),
                iconWidget(
                    icon: Icon(Icons.person),
                    color: Colors.blue,
                    text: 'Contacts'),
              ],
            )
          ]),
        ),
      ),
    );
  }

  Widget iconWidget({Icon? icon, Color? color, String? text}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: icon,
        ),
        SizedBox(
          height: 10,
        ),
        Text(text!)
      ],
    );
  }
}

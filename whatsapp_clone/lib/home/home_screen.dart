import 'package:flutter/material.dart';
import 'package:whatsapp_clone/call/callScreen.dart';
import 'package:whatsapp_clone/camera/camera_screen.dart';
import 'package:whatsapp_clone/chats/chatscreen.dart';
import 'package:whatsapp_clone/status/status_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(controller: _controller, tabs: const [
          Tab(
            icon: Icon(Icons.camera_alt),
          ),
          Tab(
            text: 'CHATS',
          ),
          Tab(
            text: 'STATUS',
          ),
          Tab(
            text: 'CALLS',
          )
        ]),
        title: const Text('Whatsapp'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const SizedBox(
            width: 20,
          ),
          PopupMenuButton(onSelected: (value) {
            print(value);
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 1,
                child: Text('New Group'),
              ),
              const PopupMenuItem(
                child: Text('New broadcast'),
              ),
              const PopupMenuItem(
                child: Text('Linked devices'),
              ),
              const PopupMenuItem(
                child: Text('Starred messages'),
              ),
              const PopupMenuItem(
                child: Text('Payments'),
              ),
              const PopupMenuItem(
                child: Text('Settings'),
              ),
            ];
          })
        ],
      ),
      body: TabBarView(
        controller: _controller,
        children: [CameraPage(), ChatPage(), StatusPage(), CallScreen()],
      ),
    );
  }
}

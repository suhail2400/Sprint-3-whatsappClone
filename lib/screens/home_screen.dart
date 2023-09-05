import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/camera.dart';
import 'package:whatsapp_clone/screens/chatScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
        backgroundColor: Colors.teal,
        title: const Text(
          'Whatsapp',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt,
              )),
          IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: const Icon(Icons.search)),
          PopupMenuButton(
            color: Colors.white,
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 1,
                  child: Text('New group'),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text('New broadcast'),
                ),
                const PopupMenuItem(
                  value: 3,
                  child: Text('Linked devices'),
                ),
                const PopupMenuItem(
                  value: 4,
                  child: Text('Starred messages'),
                ),
                const PopupMenuItem(
                  value: 5,
                  child: Text('Payments'),
                ),
                const PopupMenuItem(value: 6, child: Text('Settings')),
              ];
            },
          )
        ],
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.white,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'Chats',
            ),
            Tab(text: 'Status'),
            Tab(text: 'Calls'),
          ],
          controller: _controller,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          Camera(),
          ChatScreen(),
          Text('Status'),
          Text('Calls'),
        ],
      ),
    );
  }
}

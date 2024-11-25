import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            shape: const CircleBorder(),
            child: const Icon(Icons.add, color: Colors.white),
            onPressed: () {},
          ),
            backgroundColor: Colors.black,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              title: const TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Verified'),
                  Tab(text: 'Mentions')
                ],
              ),
            ),
            body: const Center(
                child: Text(
              'Notifications Page',
              style: TextStyle(color: Colors.white),
            ))));
  }
}

import 'package:flutter/material.dart';
import 'package:social_media_x/widgets/common/floating_button.dart';
import 'package:social_media_x/widgets/common/tab_bar_header.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            floatingActionButton: FloatingButton(
              onPressed: () {
                ('Floating Action Button Pressed!');
              },
              icon: Icons.add,
            ),
            backgroundColor: Colors.black,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              title: const TabBarHeader(
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Verified'),
                  Tab(text: 'Mentions'),
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

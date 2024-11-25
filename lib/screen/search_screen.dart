import 'package:flutter/material.dart';
import 'package:social_media_x/widgets/common/floating_button.dart';
import 'package:social_media_x/widgets/common/tab_bar_header.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Número de pestañas
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
              Tab(text: 'For you'),
              Tab(text: 'Trending'),
              Tab(text: 'News'),
              Tab(text: 'Sports'),
              Tab(text: 'Entertainment'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text(
                'For You Page',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                'Treding page',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                'News Page',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                'Sports Page',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                'Enterteiment Page',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

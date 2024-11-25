import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Número de pestañas
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {},
        ),
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0, // Sin sombra
          title: Container(
            alignment: Alignment.centerLeft, // Alinea la TabBar a la izquierda
            child: const TabBar(
              isScrollable: false,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              indicatorColor: Colors.blue,
              indicatorWeight: 3.0,
              tabs: [
                Tab(text: 'For you'),
                Tab(text: 'Trending'),
                Tab(text: 'News'),
                Tab(text: 'Sports'),
                Tab(text: 'Entertainment'),
              ],
            ),
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

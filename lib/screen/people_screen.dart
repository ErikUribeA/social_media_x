import 'package:flutter/material.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.blue,
            indicatorWeight: 3.0,
            tabs: [
              Tab(text: 'Home'), // Primera pestaña
              Tab(text: 'Explore'), // Segunda pestaña
            ],
          ),
        ),
        body: const Center(
          child: Text(
            'Communities page',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
